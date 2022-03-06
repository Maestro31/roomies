import 'package:either_dart/either.dart';

import '../core/auth/auth_gateway.dart';
import '../core/auth/exceptions.dart';
import '../core/auth/models/user.dart';

class FakeAuthGateway implements AuthGateway {
  Map<String, User> users = {};

  @override
  Future<Either<AuthException, User>> register(
      String email, String firstName, String lastName, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'existing@test.fr') {
      return Left(UserAlreadyExistsException());
    }
    User user = User(email: email, firstName: firstName, lastName: lastName, id: 'default-id');
    users["$email-$password"] = user;
    return Right(user);
  }

  @override
  Future<Either<AuthException, User>> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));

    User? user = users["$email-$password"];

    if (user == null) {
      return Left(InvalidCredentialsException());
    }

    return Right(user);
  }
}
