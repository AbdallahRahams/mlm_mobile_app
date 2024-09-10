abstract class WholesalerState {}

class WholesalerInitial extends WholesalerState {}

class WholesalerLoading extends WholesalerState {}

class WholesalerVerified extends WholesalerState {
  final String wholesalerId;

  WholesalerVerified({required this.wholesalerId});
}

class WholesalerError extends WholesalerState {
  final String message;

  WholesalerError(this.message);
}
