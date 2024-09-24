import 'package:equatable/equatable.dart';

// Abstract class for NetworkEvent
abstract class NetworkEvent extends Equatable {
  const NetworkEvent(); // Constructor

  @override
  List<Object> get props => [];
}

// Event class for fetching network details
class FetchNetworkDetailsEvent extends NetworkEvent {
  final String networkId;

  const FetchNetworkDetailsEvent(this.networkId);

  @override
  List<Object> get props => [networkId]; // Ensure that Equatable can compare the networkId
}
