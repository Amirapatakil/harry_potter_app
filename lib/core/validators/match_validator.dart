import 'package:harry_potter_app/core/validators/app_validators.dart';

class MatchValidators extends AppValidators {
  @override
  String? validators(String? value) {
    if (value != value) {
      return 'Passwords does not match!';
    }
    return null;
  }
}
