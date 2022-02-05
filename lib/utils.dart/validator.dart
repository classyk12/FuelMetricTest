import 'package:get/get.dart';

class Validator {
  Validator._();

  static validateDefault(value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static validateDropdown(value) {
    if (value == null || value.isEmpty) {
      return 'Please select a value';
    }
    return null;
  }

  static validateEmail(String value) {
    value = value.trim();
    if (value.isEmpty) {
      return 'Please your email';
    } else if (!value.isEmail) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static validatephone(String value) {
    if (value.isEmpty) {
      return 'Please enter a valid phone number';
    }
    return null;
  }
}
