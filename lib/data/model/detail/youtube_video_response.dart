library youtube_video_response;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:youtube_search_tutorial/data/model/detail/video_item.dart';
import 'package:youtube_search_tutorial/data/model/serializer/serializers.dart';

part 'youtube_video_response.g.dart';

abstract class YoutubeVideoResponse
    implements Built<YoutubeVideoResponse, YoutubeVideoResponseBuilder> {
  BuiltList<VideoItem> get items;

  YoutubeVideoResponse._();

  factory YoutubeVideoResponse([updates(YoutubeVideoResponseBuilder b)]) =
      _$YoutubeVideoResponse;

  String toJson() {
    return json.encode(
        serializers.serializeWith(YoutubeVideoResponse.serializer, this));
  }

  static YoutubeVideoResponse fromJson(String jsonString) {
    return serializers.deserializeWith(
        YoutubeVideoResponse.serializer, json.decode(jsonString));
  }

  static Serializer<YoutubeVideoResponse> get serializer =>
      _$youtubeVideoResponseSerializer;
}
