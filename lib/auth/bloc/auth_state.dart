part of './auth_bloc.dart';

class AuthState extends Equatable {
  final User user;
  final AuthStatus status;
  final String? errorMessage;

  const AuthState({required this.user, required this.status, this.errorMessage});

  const AuthState.initial()
      : user = const User.empty(),
        status = AuthStatus.idle,
        errorMessage = null;

  const AuthState.pending()
      : user = const User.empty(),
        status = AuthStatus.pending,
        errorMessage = null;

  @override
  List<Object?> get props => [user, status, errorMessage];

  AuthState copyWith({
    User? user,
    AuthStatus? status,
    String? errorMessage,
  }) {
    return AuthState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  AuthState registerSuccess(User user) =>
      const AuthState.initial().copyWith(user: user, status: AuthStatus.connected);

  AuthState registerFail(String errorMessage) => const AuthState.initial()
      .copyWith(status: AuthStatus.disconnected, errorMessage: errorMessage);
}
