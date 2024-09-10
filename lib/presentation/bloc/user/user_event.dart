abstract class UserEvent {}

class GetUserInfoEvent extends UserEvent {
  final String userId;

  GetUserInfoEvent(this.userId);
}
