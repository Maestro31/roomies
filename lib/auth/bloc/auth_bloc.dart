import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../core/auth/models/auth_status.dart';
import '../../core/auth/models/user.dart';
import '../../core/auth/auth_gateway.dart';
import '../../core/auth/use_cases/login.dart';
import '../../core/auth/use_cases/register.dart';

part 'auth_events.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthGateway authGateway;

  AuthBloc(this.authGateway) : super(const AuthState.initial()) {
    on<AuthRegistrationSubmitted>(register(authGateway, state));
    on<AuthLoginSubmitted>(login(authGateway, state));
    on<AuthUserDisconnected>((state, emit) {
      emit(const AuthState.initial());
    });
  }
}
