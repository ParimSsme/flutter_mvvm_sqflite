enum DatabaseTables<T extends Object> {

  poet<String>('poet');

  const DatabaseTables(this.value);
  final T value;

}

enum Status {
  none,
  running,
  stopped,
  paused
}