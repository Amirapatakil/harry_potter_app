import 'package:harry_potter_app/core/enums/state_status.dart';

class HousesState<T> {
  final T model;
  final StateStatus status;

  HousesState({
    required this.model,
    required this.status,
  });
}
