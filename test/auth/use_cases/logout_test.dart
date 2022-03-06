import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roomies/auth/bloc/auth_bloc.dart';
import 'package:roomies/core/auth/models/auth_status.dart';

import '../builders/user_builder.dart';
import '../in_memory_auth_gateway.dart';

void main() {
  group('Logout', () {
    late AuthBloc authBloc;
    late InMemoryAuthGateway authGateway;

    setUp(() {
      authGateway = InMemoryAuthGateway();
      authBloc = AuthBloc(authGateway);
    });

    blocTest(
      'should logout',
      seed: () => AuthState(status: AuthStatus.connected, user: UserBuilder().build()),
      build: () => authBloc,
      act: (AuthBloc bloc) => bloc.add(AuthUserDisconnected()),
      expect: () => [
        const AuthState.initial(),
      ],
    );
  });
}
