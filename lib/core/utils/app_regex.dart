/// Regular expressions for form validation
class AppRegex {
  /// Email validation regex
  static const String emailRegex =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  /// Password validation regex patterns

  /// Checks if password contains at least one lowercase letter (a-z)
  static const String hasLowerCaseRegex = r'[a-z]';

  /// Checks if password contains at least one uppercase letter (A-Z)
  static const String hasUpperCaseRegex = r'[A-Z]';

  /// Checks if password contains at least one special character
  static const String hasSpecialCharactersRegex = r'[!@#$%^&*(),.?":{}|<>]';

  /// Checks if password contains at least one number (0-9)
  static const String hasNumberRegex = r'[0-9]';

  /// Minimum password length (8 characters)
  static const int minPasswordLength = 8;

  /// Validates email format
  static bool isEmailValid(String email) {
    return RegExp(emailRegex).hasMatch(email);
  }

  /// Validates if password has lowercase letter
  static bool hasLowerCase(String password) {
    return RegExp(hasLowerCaseRegex).hasMatch(password);
  }

  /// Validates if password has uppercase letter
  static bool hasUpperCase(String password) {
    return RegExp(hasUpperCaseRegex).hasMatch(password);
  }

  /// Validates if password has special characters
  static bool hasSpecialCharacters(String password) {
    return RegExp(hasSpecialCharactersRegex).hasMatch(password);
  }

  /// Validates if password has number
  static bool hasNumber(String password) {
    return RegExp(hasNumberRegex).hasMatch(password);
  }

  /// Validates if password meets minimum length requirement
  static bool hasMinLength(String password) {
    return password.length >= minPasswordLength;
  }

  /// Comprehensive password validation
  static bool isPasswordValid(String password) {
    return hasLowerCase(password) &&
        hasUpperCase(password) &&
        hasSpecialCharacters(password) &&
        hasNumber(password) &&
        hasMinLength(password);
  }
}
