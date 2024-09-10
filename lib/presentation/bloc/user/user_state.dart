abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final String userId;

  UserLoaded({required this.userId});
}

class UserError extends UserState {
  final String message;

  UserError(this.message);
}
