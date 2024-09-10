abstract class WholesalerEvent {}

class VerifyWholesalerEvent extends WholesalerEvent {
  final String wholesalerId;

  VerifyWholesalerEvent(this.wholesalerId);
}
