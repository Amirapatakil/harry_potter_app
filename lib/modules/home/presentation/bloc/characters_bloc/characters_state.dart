import 'package:harry_potter_app/core/enums/state_status.dart';

class CharactersState<T> {
  final T model;
  final StateStatus status;

  CharactersState({
    required this.model,
    required this.status,
  });
}
