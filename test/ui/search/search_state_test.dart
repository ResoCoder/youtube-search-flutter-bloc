import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:youtube_search_tutorial/data/model/search/model_search.dart';
import 'package:youtube_search_tutorial/ui/search/search_state.dart';

void main() {
  group('SearchState custom getter', () {
    SearchState initial;
    SearchState loading;
    SearchState success;
    SearchState failure;

    String fixture(String name) =>
        File('test/data/fixtures/$name.json').readAsStringSync();

    setUp(() {
      final searchResultList =
          YoutubeSearchResult.fromJson(fixture('search_result')).items;

      initial = SearchState.initial();
      loading = SearchState.loading();
      success = SearchState.success(searchResultList);
      failure = SearchState.failure('Test error');
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
