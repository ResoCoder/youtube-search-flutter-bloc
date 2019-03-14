// GENERATED CODE - DO NOT MODIFY BY HAND

part of youtube_video_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<YoutubeVideoResponse> _$youtubeVideoResponseSerializer =
    new _$YoutubeVideoResponseSerializer();

class _$YoutubeVideoResponseSerializer
    implements StructuredSerializer<YoutubeVideoResponse> {
  @override
  final Iterable<Type> types = const [
    YoutubeVideoResponse,
    _$YoutubeVideoResponse
  ];
  @override
  final String wireName = 'YoutubeVideoResponse';

  @override
  Iterable serialize(Serializers serializers, YoutubeVideoResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'items',
      serializers.serialize(object.items,
          specifiedType:
              const FullType(BuiltList, const [const FullType(VideoItem)])),
    ];

    return result;
  }

  @override
  YoutubeVideoResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new YoutubeVideoResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'items':
          result.items.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(VideoItem)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$YoutubeVideoResponse extends YoutubeVideoResponse {
  @override
  final BuiltList<VideoItem> items;

  factory _$YoutubeVideoResponse(
          [void updates(YoutubeVideoResponseBuilder b)]) =>
      (new YoutubeVideoResponseBuilder()..update(updates)).build();

  _$YoutubeVideoResponse._({this.items}) : super._() {
    if (items == null) {
      throw new BuiltValueNullFieldError('YoutubeVideoResponse', 'items');
    }
  }

  @override
  YoutubeVideoResponse rebuild(void updates(YoutubeVideoResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  YoutubeVideoResponseBuilder toBuilder() =>
      new YoutubeVideoResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is YoutubeVideoResponse && items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc(0, items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('YoutubeVideoResponse')
          ..add('items', items))
        .toString();
  }
}

class YoutubeVideoResponseBuilder
    implements Builder<YoutubeVideoResponse, YoutubeVideoResponseBuilder> {
  _$YoutubeVideoResponse _$v;

  ListBuilder<VideoItem> _items;
  ListBuilder<VideoItem> get items =>
      _$this._items ??= new ListBuilder<VideoItem>();
  set items(ListBuilder<VideoItem> items) => _$this._items = items;

  YoutubeVideoResponseBuilder();

  YoutubeVideoResponseBuilder get _$this {
    if (_$v != null) {
      _items = _$v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(YoutubeVideoResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$YoutubeVideoResponse;
  }

  @override
  void update(void updates(YoutubeVideoResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$YoutubeVideoResponse build() {
    _$YoutubeVideoResponse _$result;
    try {
      _$result = _$v ?? new _$YoutubeVideoResponse._(items: items.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'items';
        items.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'YoutubeVideoResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
