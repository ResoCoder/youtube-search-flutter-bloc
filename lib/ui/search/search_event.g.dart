// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchInitiated extends SearchInitiated {
  @override
  final String query;

  factory _$SearchInitiated([void updates(SearchInitiatedBuilder b)]) =>
      (new SearchInitiatedBuilder()..update(updates)).build();

  _$SearchInitiated._({this.query}) : super._() {
    if (query == null) {
      throw new BuiltValueNullFieldError('SearchInitiated', 'query');
    }
  }

  @override
  SearchInitiated rebuild(void updates(SearchInitiatedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchInitiatedBuilder toBuilder() =>
      new SearchInitiatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchInitiated && query == other.query;
  }

  @override
  int get hashCode {
    return $jf($jc(0, query.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchInitiated')..add('query', query))
        .toString();
  }
}

class SearchInitiatedBuilder
    implements Builder<SearchInitiated, SearchInitiatedBuilder> {
  _$SearchInitiated _$v;

  String _query;
  String get query => _$this._query;
  set query(String query) => _$this._query = query;

  SearchInitiatedBuilder();

  SearchInitiatedBuilder get _$this {
    if (_$v != null) {
      _query = _$v.query;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchInitiated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchInitiated;
  }

  @override
  void update(void updates(SearchInitiatedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchInitiated build() {
    final _$result = _$v ?? new _$SearchInitiated._(query: query);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
