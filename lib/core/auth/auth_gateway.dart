import 'package:either_dart/either.dart';

import 'exceptions.dart';
import 'models/user.dart';

abstract class AuthGateway {
  Future<Either<AuthException, User>> register(
      String email, String firstName, String lastName, String password);
  Future<Either<AuthException, User>> login(String email, String password);
}
