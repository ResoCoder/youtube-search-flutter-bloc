import 'dart:io';

import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:youtube_search_tutorial/data/model/detail/model_detail.dart';
import 'package:youtube_search_tutorial/data/repository/youtube_repository.dart';
import 'package:youtube_search_tutorial/ui/detail/detail.dart';

class MockYoutubeRepository extends Mock implements YoutubeRepository {}

void main() {
  DetailBloc detailBloc;
  MockYoutubeRepository mockRepository;

  String fixture(String name) =>
      File('test/data/fixtures/$name.json').readAsStringSync();

  setUp(() {
    mockRepository = MockYoutubeRepository();
    detailBloc = DetailBloc(mockRepository);
  });

  test('initial state is correct', () {
    expect(detailBloc.initialState, DetailState.initial());
  });

  group('ShowDetail', () {
    VideoItem videoItem;

    setUp(() {
      videoItem =
          YoutubeVideoResponse.fromJson(fixture('video_response')).items[0];
    });

    test('emits [loading, success] for a valid video id', () async {
      when(mockRepository.fetchVideoInfo(id: anyNamed('id')))
          .thenAnswer((_) async => videoItem);

      final expectedResult = [
        DetailState.initial(),
        DetailState.loading(),
        DetailState.success(videoItem),
      ];

      expectLater(
        detailBloc.state,
        emitsInOrder(expectedResult),
      );

      detailBloc.onShowDetail(id: 'abcd');

      await untilCalled(mockRepository.fetchVideoInfo(id: anyNamed('id')));

      verify(
        mockRepository.fetchVideoInfo(
          id: argThat(equals('abcd'), named: 'id'),
        ),
      );
    });

    test(
      'emits [loading, failure] when the repository throws a YoutubeVideoError',
      () async {
        when(mockRepository.fetchVideoInfo(id: anyNamed('id')))
            .thenThrow(YoutubeVideoError('Test message'));

        final expectedResult = [
          DetailState.initial(),
          DetailState.loading(),
          DetailState.failure('Test message'),
        ];

        expectLater(
          detailBloc.state,
          emitsInOrder(expectedResult),
        );

        detailBloc.onShowDetail(id: 'erroneous');

        await untilCalled(mockRepository.fetchVideoInfo(id: anyNamed('id')));

        verify(
          mockRepository.fetchVideoInfo(
            id: argThat(equals('erroneous'), named: 'id'),
          ),
        );
      },
    );

    test(
      'emits [loading, failure] when the repository throws a NoSuchVideoException',
      () async {
        when(mockRepository.fetchVideoInfo(id: anyNamed('id')))
            .thenThrow(NoSuchVideoException());

        final expectedResult = [
          DetailState.initial(),
          DetailState.loading(),
          DetailState.failure(NoSuchVideoException().message),
        ];

        expectLater(
          detailBloc.state,
          emitsInOrder(expectedResult),
        );

        detailBloc.onShowDetail(id: 'erroneous');

        await untilCalled(mockRepository.fetchVideoInfo(id: anyNamed('id')));

        verify(
          mockRepository.fetchVideoInfo(
            id: argThat(equals('erroneous'), named: 'id'),
          ),
        );
      },
    );
  });
}
