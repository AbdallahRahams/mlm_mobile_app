import 'package:bloc/bloc.dart';
import 'network_event.dart';
import 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(NetworkInitial()) {
    on<FetchNetworkDetailsEvent>((event, emit) {
      emit(NetworkLoading());
      // Assume success in fetching network details
      emit(NetworkLoaded(networkId: event.networkId));
    });
  }
}
