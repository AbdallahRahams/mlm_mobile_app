abstract class NetworkState {}

class NetworkInitial extends NetworkState {}

class NetworkLoading extends NetworkState {}

class NetworkLoaded extends NetworkState {
  final String networkId;
  final String networkName;
  final int totalMembers;
  final double totalEarnings;
  final String ranking;

  NetworkLoaded({
    required this.networkId,
    required this.networkName,
    required this.totalMembers,
    required this.totalEarnings,
    required this.ranking,
  });
}

class NetworkError extends NetworkState {
  final String message;

  NetworkError(this.message);
}
