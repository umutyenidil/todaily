abstract interface class TodoRemoteDataSource {
  Future<void> addTodo({
    required String title,
    required String description,
  });
}
