import 'dart:async';

import 'package:either_dart/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:roomies/core/auth/auth_gateway.dart';

import '../../../auth/bloc/auth_bloc.dart';
import '../exceptions.dart';
import '../models/user.dart';

Future<void> Function(AuthRegistrationSubmitted, Emitter<AuthState>) register(
    AuthGateway authGateway, AuthState state) {
  return (event, emit) async {
    emit(const AuthState.pending());
    Either<AuthException, User> result =
        await authGateway.register(event.email, event.firstName, event.lastName, event.password);

    if (result.isLeft) {
      emit(state.registerFail(result.left.message));
      return;
    }

    emit(state.registerSuccess(result.right));
  };
}
