library search_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:youtube_search_tutorial/data/model/search/model_search.dart';

part 'search_state.g.dart';

abstract class SearchState implements Built<SearchState, SearchStateBuilder> {
  bool get isLoading;
  BuiltList<SearchItem> get searchResults;
  String get error;
  bool get hasReachedEndOfResults;

  bool get isInitial => !isLoading && searchResults.isEmpty && error == '';
  bool get isSuccessful =>
      !isLoading && searchResults.isNotEmpty && error == '';

  SearchState._();

  factory SearchState([updates(SearchStateBuilder b)]) = _$SearchState;

  factory SearchState.initial() {
    return SearchState((b) => b
      ..isLoading = false
      ..searchResults.replace(BuiltList<SearchItem>())
      ..error = ''
      ..hasReachedEndOfResults = false);
  }

  factory SearchState.loading() {
    return SearchState((b) => b
      ..isLoading = true
      ..searchResults.replace(BuiltList<SearchItem>())
      ..error = ''
      ..hasReachedEndOfResults = false);
  }

  factory SearchState.failure(String error) {
    return SearchState((b) => b
      ..isLoading = false
      ..searchResults.replace(BuiltList<SearchItem>())
      ..error = error
      ..hasReachedEndOfResults = false);
  }

  factory SearchState.success(BuiltList<SearchItem> resultList) {
    return SearchState((b) => b
      ..isLoading = false
      ..searchResults.replace(resultList)
      ..error = ''
      ..hasReachedEndOfResults = false);
  }
}
