abstract class EarningsEvent {}

class FetchEarningsEvent extends EarningsEvent {
  final String userId;

  FetchEarningsEvent(this.userId);
}
