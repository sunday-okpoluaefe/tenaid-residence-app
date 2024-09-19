abstract class UseCase<I, O> {
  const UseCase();

  Future<O> call(I args);
}
