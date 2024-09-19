class Resettable<T> {
  T? _value;

  Resettable([this._value]);

  T? get() {
    if (_value != null) {
      final result = _value;
      _value = null;
      return result;
    }
    return null;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (runtimeType != other.runtimeType) return false;

    return other is Resettable && _value == other._value;
  }

  @override
  int get hashCode => _value?.hashCode ?? 0;
}
