abstract class NetworkState {}

class NetworkInitial extends NetworkState {}

class NetworkLoading extends NetworkState {}

class NetworkLoaded extends NetworkState {
  final String networkId;

  NetworkLoaded({required this.networkId});
}

class NetworkError extends NetworkState {
  final String message;

  NetworkError(this.message);
}
