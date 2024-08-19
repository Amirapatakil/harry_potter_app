import 'package:harry_potter_app/core/enums/state_status.dart';

class BooksState<T> {
  final T model;
  final StateStatus status;

  BooksState({
    required this.model,
    required this.status,
  });
}
