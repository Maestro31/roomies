import 'package:either_dart/either.dart';
import 'package:roomies/core/auth/auth_gateway.dart';
import 'package:roomies/core/auth/exceptions.dart';
import 'package:roomies/core/auth/models/user.dart';

class InMemoryAuthGateway implements AuthGateway {
  Either<AuthException, User>? result;

  void willReturn(Either<AuthException, User> result) {
    this.result = result;
  }

  @override
  Future<Either<AuthException, User>> register(
      String email, String firstName, String lastName, String password) async {
    return Future.value(result);
  }

  @override
  Future<Either<AuthException, User>> login(String email, String password) {
    return Future.value(result);
  }
}
