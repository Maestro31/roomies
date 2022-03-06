import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:roomies/auth/bloc/auth_bloc.dart';
import 'package:roomies/core/auth/exceptions.dart';
import 'package:roomies/core/auth/models/auth_status.dart';
import 'package:roomies/core/auth/models/user.dart';
import 'package:test/test.dart';

import '../in_memory_auth_gateway.dart';

void main() {
  group('Register', () {
    late AuthBloc authBloc;
    late InMemoryAuthGateway authGateway;

    setUp(() {
      authGateway = InMemoryAuthGateway();
      authBloc = AuthBloc(authGateway);
    });

    test('initial state is correct', () {
      expect(authBloc.state, equals(const AuthState.initial()));
    });

    blocTest('cannot register when user already exist with the same email',
        build: () {
          authGateway.willReturn(Left(UserAlreadyExistsException()));
          return authBloc;
        },
        act: (AuthBloc bloc) => bloc.add(AuthRegistrationSubmitted(
            email: 'test@test.fr', firstName: 'John', lastName: 'Doe', password: 'test-password')),
        expect: () => [
              const AuthState.pending(),
              const AuthState.initial().copyWith(
                  errorMessage: 'User already exists with this email',
                  status: AuthStatus.disconnected)
            ]);

    blocTest('is successfull',
        build: () {
          authGateway.willReturn(const Right(
              User(email: 'test@test.fr', firstName: 'John', lastName: 'Doe', id: 'test-id')));
          return authBloc;
        },
        act: (AuthBloc bloc) => authBloc.add(AuthRegistrationSubmitted(
            email: 'test@test.fr', firstName: 'John', lastName: 'Doe', password: 'test-password')),
        expect: () => [
              const AuthState.pending(),
              isA<AuthState>()
                  .having(
                      (state) => state.user,
                      'user',
                      isA<User>()
                          .having((user) => user.email, 'email', isNotEmpty)
                          .having((user) => user.firstName, 'firstName', isNotEmpty)
                          .having((user) => user.lastName, 'lastName', isNotEmpty)
                          .having((user) => user.id, 'id', isNotEmpty))
                  .having((state) => state.status, 'status', AuthStatus.connected),
            ]);
  });
}
