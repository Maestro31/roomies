class AuthException implements Exception {
  final String message;

  AuthException([this.message = '']);

  @override
  String toString() {
    return 'AuthException: $message';
  }
}

class UserAlreadyExistsException extends AuthException {
  UserAlreadyExistsException() : super('User already exists with this email');
}

class InvalidCredentialsException extends AuthException {
  InvalidCredentialsException() : super('Invalid credentials');
}
