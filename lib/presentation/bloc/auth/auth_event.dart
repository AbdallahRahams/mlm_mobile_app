abstract class AuthEvent {}

class AuthSignInEvent extends AuthEvent {
  final String username;
  final String password;

  AuthSignInEvent(this.username, this.password);
}

class AuthSignOutEvent extends AuthEvent {}

class AuthSignUpEvent extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final String phoneNumber;

  AuthSignUpEvent({
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });
}
