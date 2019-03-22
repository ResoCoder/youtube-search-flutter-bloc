// GENERATED CODE - DO NOT MODIFY BY HAND

part of detail_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DetailState extends DetailState {
  @override
  final bool isLoading;
  @override
  final VideoItem videoItem;
  @override
  final String error;

  factory _$DetailState([void updates(DetailStateBuilder b)]) =>
      (new DetailStateBuilder()..update(updates)).build();

  _$DetailState._({this.isLoading, this.videoItem, this.error}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('DetailState', 'isLoading');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('DetailState', 'error');
    }
  }

  @override
  DetailState rebuild(void updates(DetailStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DetailStateBuilder toBuilder() => new DetailStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DetailState &&
        isLoading == other.isLoading &&
        videoItem == other.videoItem &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, isLoading.hashCode), videoItem.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DetailState')
          ..add('isLoading', isLoading)
          ..add('videoItem', videoItem)
          ..add('error', error))
        .toString();
  }
}

class DetailStateBuilder implements Builder<DetailState, DetailStateBuilder> {
  _$DetailState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  VideoItemBuilder _videoItem;
  VideoItemBuilder get videoItem =>
      _$this._videoItem ??= new VideoItemBuilder();
  set videoItem(VideoItemBuilder videoItem) => _$this._videoItem = videoItem;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  DetailStateBuilder();

  DetailStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _videoItem = _$v.videoItem?.toBuilder();
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DetailState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DetailState;
  }

  @override
  void update(void updates(DetailStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DetailState build() {
    _$DetailState _$result;
    try {
      _$result = _$v ??
          new _$DetailState._(
              isLoading: isLoading,
              videoItem: _videoItem?.build(),
              error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'videoItem';
        _videoItem?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DetailState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
