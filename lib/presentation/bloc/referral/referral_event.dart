abstract class ReferralEvent {}

class FetchReferralDataEvent extends ReferralEvent {
  final String userId;

  FetchReferralDataEvent(this.userId);
}
