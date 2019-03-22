library detail_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:youtube_search_tutorial/data/model/detail/video_item.dart';

part 'detail_state.g.dart';

abstract class DetailState implements Built<DetailState, DetailStateBuilder> {
  bool get isLoading;
  @nullable
  VideoItem get videoItem;
  String get error;

  bool get isInitial => !isLoading && videoItem == null && error == '';
  bool get isSuccessful => !isLoading && videoItem != null && error == '';

  DetailState._();

  factory DetailState([updates(DetailStateBuilder b)]) = _$DetailState;

  factory DetailState.initial() {
    return DetailState((b) => b
      ..isLoading = false
      ..videoItem = null
      ..error = '');
  }

  factory DetailState.loading() {
    return DetailState((b) => b
      ..isLoading = true
      ..videoItem = null
      ..error = '');
  }

  factory DetailState.failure(String error) {
    return DetailState((b) => b
      ..isLoading = false
      ..videoItem = null
      ..error = error);
  }

  factory DetailState.success(VideoItem videoItem) {
    return DetailState((b) => b
      ..isLoading = false
      ..videoItem.replace(videoItem)
      ..error = '');
  }
}
