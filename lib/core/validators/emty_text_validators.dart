import 'package:harry_potter_app/core/validators/app_validators.dart';

class EmptyValidator extends AppValidators {
  @override
  String? validators(String? value) {
    if (value?.isEmpty ?? false || value == null) {
      return 'This field is empty!';
    }
    return null;
  }
}
