import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';
import 'package:mockito/mockito.dart';
import 'package:youtube_search_tutorial/data/model/search/model_search.dart';
import 'package:youtube_search_tutorial/data/repository/youtube_repository.dart';
import 'package:youtube_search_tutorial/ui/search/search.dart';
import 'package:youtube_search_tutorial/ui/search/search_state.dart';

class MockYoutubeRepository extends Mock implements YoutubeRepository {}

void main() {
  SearchBloc searchBloc;
  MockYoutubeRepository mockRepository;

  String fixture(String name) =>
      File('test/data/fixtures/$name.json').readAsStringSync();

  setUp(() {
    mockRepository = MockYoutubeRepository();
    searchBloc = SearchBloc(mockRepository);
  });

  test('initial state is correct', () {
    expect(searchBloc.initialState, SearchState.initial());
  });

  group('SearchInitiated', () {
    BuiltList<SearchItem> searchResultList;

    setUp(() {
      searchResultList =
          YoutubeSearchResult.fromJson(fixture('search_result')).items;

      when(
        mockRepository.searchVideos(any),
      ).thenAnswer((_) async => searchResultList);
    });

    test('emits ["nothing"] (only initial state) for an empty search string',
        () {
      final expectedResponse = [
        SearchState.initial(),
      ];

      expectLater(
        searchBloc.state,
        emitsInOrder(expectedResponse),
      );

      searchBloc.onSearchInitiated('');

      verifyNever(mockRepository.searchVideos(any));
    });

    test(
      'emits [loading, success] for a valid search string',
      () async {
        final expectedResponse = [
          SearchState.initial(),
          SearchState.loading(),
          SearchState.success(searchResultList)
        ];

        expectLater(
          searchBloc.state,
          emitsInOrder(expectedResponse),
        );

        searchBloc.onSearchInitiated('resocoder');

        await untilCalled(mockRepository.searchVideos(any));

        verify(mockRepository.searchVideos(argThat(equals('resocoder'))));
      },
    );

    test(
        'emits [loading, success, initial] for a search string which is first valid and then empty',
        () async {
      final expectedResponse = [
        SearchState.initial(),
        SearchState.loading(),
        SearchState.success(searchResultList),
        SearchState.initial(),
      ];

      expectLater(
        searchBloc.state,
        emitsInOrder(expectedResponse),
      );

      searchBloc.onSearchInitiated('resocoder');
      searchBloc.onSearchInitiated('');

      await untilCalled(mockRepository.searchVideos(any));

      verify(mockRepository.searchVideos(argThat(equals('resocoder'))))
          .called(1);
    });

    test('emits [loading, failure] when repository throws a YoutubeSearchError',
        () async {
      reset(mockRepository);
      when(
        mockRepository.searchVideos(any),
      ).thenThrow(YoutubeSearchError('Test Message'));

      final expectedResponse = [
        SearchState.initial(),
        SearchState.loading(),
        SearchState.failure('Test Message')
      ];

      expectLater(
        searchBloc.state,
        emitsInOrder(expectedResponse),
      );

      searchBloc.onSearchInitiated('resocoder');

      await untilCalled(mockRepository.searchVideos(any));

      verify(mockRepository.searchVideos(argThat(equals('resocoder'))))
          .called(1);
    });

    test(
      'emits [loading, failure] when repository throws a NoSearchResultsException',
      () async {
        reset(mockRepository);
        when(
          mockRepository.searchVideos(any),
        ).thenThrow(NoSearchResultsException());

        final expectedResponse = [
          SearchState.initial(),
          SearchState.loading(),
          SearchState.failure(NoSearchResultsException().message)
        ];

        expectLater(
          searchBloc.state,
          emitsInOrder(expectedResponse),
        );

        searchBloc.onSearchInitiated('sadfsadklfsajdfjasljflkj');

        await untilCalled(mockRepository.searchVideos(any));
        verify(mockRepository.searchVideos(
          argThat(equals('sadfsadklfsajdfjasljflkj')),
        )).called(1);
      },
    );
  });

  group('FetchNextResultPage', () {
    BuiltList<SearchItem> searchResultList;

    setUp(() {
      searchResultList =
          YoutubeSearchResult.fromJson(fixture('search_result')).items;
    });

    test(
      'emits [success] if fetchNextResultPage call is successful',
      () async {
        when(mockRepository.fetchNextResultPage())
            .thenAnswer((_) async => searchResultList);

        final expectedResponse = [
          SearchState.initial(),
          SearchState.success(searchResultList),
        ];

        expectLater(
          searchBloc.state,
          emitsInOrder(expectedResponse),
        );

        searchBloc.fetchNextResultPage();

        await untilCalled(mockRepository.fetchNextResultPage());
        verify(mockRepository.fetchNextResultPage()).called(1);
      },
    );

    test(
      'emits currentState with hasReachedEndOfResults == true when no more results are present',
      () async {
        when(mockRepository.fetchNextResultPage())
            .thenThrow(NoNextPageTokenException());

        final expectedResponse = [
          SearchState.initial(),
          SearchState.initial().rebuild((b) => b..hasReachedEndOfResults = true)
        ];

        expectLater(
          searchBloc.state,
          emitsInOrder(expectedResponse),
        );

        searchBloc.fetchNextResultPage();

        await untilCalled(mockRepository.fetchNextResultPage());
        verify(mockRepository.fetchNextResultPage()).called(1);
      },
    );

    test(
      'emits [failure] if fetchNextResultPage is called before the search has begun',
      () async {
        when(mockRepository.fetchNextResultPage())
            .thenThrow(SearchNotInitiatedException());

        final expectedResponse = [
          SearchState.initial(),
          SearchState.failure(SearchNotInitiatedException().message),
        ];

        expectLater(
          searchBloc.state,
          emitsInOrder(expectedResponse),
        );

        searchBloc.fetchNextResultPage();

        await untilCalled(mockRepository.fetchNextResultPage());
        verify(mockRepository.fetchNextResultPage()).called(1);
      },
    );

    test(
      'emits [failure] when repository throws a YoutubeSearchError',
      () async {
        when(mockRepository.fetchNextResultPage())
            .thenThrow(YoutubeSearchError('Test Message'));

        final expectedResponse = [
          SearchState.initial(),
          SearchState.failure('Test Message')
        ];

        expectLater(
          searchBloc.state,
          emitsInOrder(expectedResponse),
        );

        searchBloc.fetchNextResultPage();

        await untilCalled(mockRepository.fetchNextResultPage());
        verify(mockRepository.fetchNextResultPage()).called(1);
      },
    );
  });
}
