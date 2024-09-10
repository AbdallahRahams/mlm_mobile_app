abstract class NetworkEvent {}

class FetchNetworkDetailsEvent extends NetworkEvent {
  final String networkId;

  FetchNetworkDetailsEvent(this.networkId);
}
