abstract class ReferralState {}

class ReferralInitial extends ReferralState {}

class ReferralLoading extends ReferralState {}

class ReferralLoaded extends ReferralState {
  final String referralId;

  ReferralLoaded({required this.referralId});
}

class ReferralError extends ReferralState {
  final String message;

  ReferralError(this.message);
}
