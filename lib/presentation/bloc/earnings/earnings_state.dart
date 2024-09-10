abstract class EarningsState {}

class EarningsInitial extends EarningsState {}

class EarningsLoading extends EarningsState {}

class EarningsLoaded extends EarningsState {
  final String earningsId;

  EarningsLoaded({required this.earningsId});
}

class EarningsError extends EarningsState {
  final String message;

  EarningsError(this.message);
}
