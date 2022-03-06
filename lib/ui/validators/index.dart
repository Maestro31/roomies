import 'package:validators/validators.dart';

String? emailValidator(String? value) {
  if (value != null && isEmail(value)) {
    return null;
  }

  return 'must be an email';
}

String? nonEmptyValidator(String? value) =>
    value == null || value == '' ? 'must be provided' : null;
