abstract class AuthEvent {}

class AuthSignInEvent extends AuthEvent {
  final String username;
  final String password;

  AuthSignInEvent(this.username, this.password);
}

class AuthSignOutEvent extends AuthEvent {}
