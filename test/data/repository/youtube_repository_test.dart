import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:youtube_search_tutorial/data/network/youtube_data_source.dart';
import 'package:youtube_search_tutorial/data/model/search/model_search.dart';
import 'package:youtube_search_tutorial/data/repository/youtube_repository.dart';

class MockYoutubeDataSource extends Mock implements YoutubeDataSource {}

void main() {
  YoutubeRepository repository;
  MockYoutubeDataSource mockDataSource;

  String fixture(String name) =>
      File('test/data/fixtures/$name.json').readAsStringSync();

  setUp(() {
    mockDataSource = MockYoutubeDataSource();
    repository = YoutubeRepository(mockDataSource);
  });

  group('Search', () {
    YoutubeSearchResult searchResult;
    YoutubeSearchResult noNextPageSearchResult;
    YoutubeSearchResult emptySearchResult;

    setUp(() {
      searchResult = YoutubeSearchResult.fromJson(fixture('search_result'));
      noNextPageSearchResult =
          YoutubeSearchResult.fromJson(fixture('search_result_no_next_page'));
      emptySearchResult =
          YoutubeSearchResult.fromJson(fixture('search_result_empty'));
    });

    group('searchVideos', () {
      test(
        'returns a List<SearchItem>',
        () async {
          when(mockDataSource.searchVideos(
            query: anyNamed('query'),
            pageToken: anyNamed('pageToken'),
          )).thenAnswer((_) async => searchResult);

          final searchResultList = await repository.searchVideos('resocoder');

          expect(searchResultList, searchResult.items);

          verify(mockDataSource.searchVideos(
            query: argThat(equals('resocoder'), named: 'query'),
            pageToken: argThat(equals(''), named: 'pageToken'),
          ));
        },
      );

      test(
        'throws a NoSearchResultsException when calling with an unknown query string',
        () async {
          when(mockDataSource.searchVideos(
            query: anyNamed('query'),
            pageToken: anyNamed('pageToken'),
          )).thenAnswer((_) async => emptySearchResult);

          expect(
            () => repository.searchVideos('fsadfkjlsadlfasdfaljkal'),
            throwsA(TypeMatcher<NoSearchResultsException>()),
          );
        },
      );
    });

    group('fetchNextResultPage', () {
      test(
        'throws a SearchNotInitiatedException when called WITHOUT previously calling searchVideos',
        () {
          expect(
            () => repository.fetchNextResultPage(),
            throwsA(TypeMatcher<SearchNotInitiatedException>()),
          );

          verifyNever(mockDataSource.searchVideos(
            query: anyNamed('query'),
            pageToken: anyNamed('pageToken'),
          ));
        },
      );

      test(
        'returns a List<SearchItem> containing the results from the next page when called AFTER calling searchVideos',
        () async {
          when(mockDataSource.searchVideos(
            query: anyNamed('query'),
            pageToken: anyNamed('pageToken'),
          )).thenAnswer((_) async => searchResult);

          await repository.searchVideos('resocoder');
          final nextPageList = await repository.fetchNextResultPage();

          expect(nextPageList, searchResult.items);

          verifyInOrder([
            mockDataSource.searchVideos(
              query: argThat(equals('resocoder'), named: 'query'),
              pageToken: argThat(equals(''), named: 'pageToken'),
            ),
            mockDataSource.searchVideos(
              query: argThat(equals('resocoder'), named: 'query'),
              pageToken: argThat(
                equals(searchResult.nextPageToken), //IMPORTANT! nextPageToken
                named: 'pageToken',
              ),
            ),
          ]);
        },
      );

      test(
        'throws a NoNextPageTokenException when called if we are at the end of the result list (hence no next page)',
        () async {
          when(mockDataSource.searchVideos(
            query: anyNamed('query'),
            pageToken: anyNamed('pageToken'),
          )).thenAnswer((_) async => noNextPageSearchResult);

          await repository.searchVideos('resocoder');

          expect(
            () => repository.fetchNextResultPage(),
            throwsA(TypeMatcher<NoNextPageTokenException>()),
          );

          verifyNever(mockDataSource.searchVideos(
            query: anyNamed('query'),
            pageToken: argThat(isNot(equals('')), named: 'pageToken'),
          ));
        },
      );
    });
  });
}
