abstract class OrderEvent {}

class FetchOrdersEvent extends OrderEvent {
  final String userId;

  FetchOrdersEvent(this.userId);
}
