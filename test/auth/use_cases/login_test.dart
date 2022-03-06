import 'package:bloc_test/bloc_test.dart';
import 'package:either_dart/either.dart';
import 'package:roomies/auth/bloc/auth_bloc.dart';
import 'package:roomies/core/auth/exceptions.dart';
import 'package:roomies/core/auth/models/auth_status.dart';
import 'package:roomies/core/auth/models/user.dart';
import 'package:test/test.dart';

import '../builders/user_builder.dart';
import '../in_memory_auth_gateway.dart';

void main() {
  group('Login', () {
    late AuthBloc authBloc;
    late InMemoryAuthGateway authGateway;

    setUp(() {
      authGateway = InMemoryAuthGateway();
      authBloc = AuthBloc(authGateway);
    });

    blocTest(
      'cannot login user when invalid credentials',
      build: () {
        authGateway.willReturn(Left(InvalidCredentialsException()));
        return authBloc;
      },
      act: (AuthBloc bloc) =>
          bloc.add(AuthLoginSubmitted(email: 'test@test.fr', password: 'test-pass')),
      expect: () => [
        const AuthState.pending(),
        const AuthState.initial()
            .copyWith(errorMessage: 'Invalid credentials', status: AuthStatus.disconnected)
      ],
    );

    blocTest(
      'should be successful',
      build: () {
        authGateway.willReturn(Right(UserBuilder().build()));
        return authBloc;
      },
      act: (AuthBloc bloc) =>
          bloc.add(AuthLoginSubmitted(email: 'test@test.fr', password: 'test-pass')),
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
      ],
    );
  });
}
