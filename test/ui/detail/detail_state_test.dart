import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:youtube_search_tutorial/data/model/detail/youtube_video_response.dart';
import 'package:youtube_search_tutorial/ui/detail/detail_state.dart';

void main() {
  group('DetailState custom getter', () {
    DetailState initial;
    DetailState loading;
    DetailState success;
    DetailState failure;

    String fixture(String name) =>
        File('test/data/fixtures/$name.json').readAsStringSync();

    setUp(() {
      final videoItem =
          YoutubeVideoResponse.fromJson(fixture('video_response')).items[0];

      initial = DetailState.initial();
      loading = DetailState.loading();
      success = DetailState.success(videoItem);
      failure = DetailState.failure('Test error');
    });

    test(
      'isInitial returns true only when instantiated with initial factory',
      () {
        expect(initial.isInitial, true);
        expect(loading.isInitial, false);
        expect(success.isInitial, false);
        expect(failure.isInitial, false);
      },
    );

    test(
      'isSuccessful returns true only when instantiated with success factory',
      () {
        expect(initial.isSuccessful, false);
        expect(loading.isSuccessful, false);
        expect(success.isSuccessful, true);
        expect(failure.isSuccessful, false);
      },
    );
  });
}
