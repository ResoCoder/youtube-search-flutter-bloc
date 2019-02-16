// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchState extends SearchState {
  @override
  final bool isLoading;
  @override
  final BuiltList<SearchItem> searchResults;
  @override
  final String error;
  @override
  final bool hasReachedEndOfResults;

  factory _$SearchState([void updates(SearchStateBuilder b)]) =>
      (new SearchStateBuilder()..update(updates)).build();

  _$SearchState._(
      {this.isLoading,
      this.searchResults,
      this.error,
      this.hasReachedEndOfResults})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('SearchState', 'isLoading');
    }
    if (searchResults == null) {
      throw new BuiltValueNullFieldError('SearchState', 'searchResults');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('SearchState', 'error');
    }
    if (hasReachedEndOfResults == null) {
      throw new BuiltValueNullFieldError(
          'SearchState', 'hasReachedEndOfResults');
    }
  }

  @override
  SearchState rebuild(void updates(SearchStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchStateBuilder toBuilder() => new SearchStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchState &&
        isLoading == other.isLoading &&
        searchResults == other.searchResults &&
        error == other.error &&
        hasReachedEndOfResults == other.hasReachedEndOfResults;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), searchResults.hashCode),
            error.hashCode),
        hasReachedEndOfResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchState')
          ..add('isLoading', isLoading)
          ..add('searchResults', searchResults)
          ..add('error', error)
          ..add('hasReachedEndOfResults', hasReachedEndOfResults))
        .toString();
  }
}

class SearchStateBuilder implements Builder<SearchState, SearchStateBuilder> {
  _$SearchState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  ListBuilder<SearchItem> _searchResults;
  ListBuilder<SearchItem> get searchResults =>
      _$this._searchResults ??= new ListBuilder<SearchItem>();
  set searchResults(ListBuilder<SearchItem> searchResults) =>
      _$this._searchResults = searchResults;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  bool _hasReachedEndOfResults;
  bool get hasReachedEndOfResults => _$this._hasReachedEndOfResults;
  set hasReachedEndOfResults(bool hasReachedEndOfResults) =>
      _$this._hasReachedEndOfResults = hasReachedEndOfResults;

  SearchStateBuilder();

  SearchStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _searchResults = _$v.searchResults?.toBuilder();
      _error = _$v.error;
      _hasReachedEndOfResults = _$v.hasReachedEndOfResults;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchState;
  }

  @override
  void update(void updates(SearchStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchState build() {
    _$SearchState _$result;
    try {
      _$result = _$v ??
          new _$SearchState._(
              isLoading: isLoading,
              searchResults: searchResults.build(),
              error: error,
              hasReachedEndOfResults: hasReachedEndOfResults);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'searchResults';
        searchResults.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
