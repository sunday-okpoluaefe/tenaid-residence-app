abstract class Either<T, E> {
  final T? success;
  final E? error;

  Either({required this.success, required this.error});
}

class Error<E> extends Either {
  Error({required E error}) : super(success: null, error: error);
}

class Success<T> extends Either {
  Success({required T success}) : super(success: success, error: null);
}
