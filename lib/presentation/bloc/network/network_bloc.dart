import 'package:bloc/bloc.dart';
import 'network_event.dart';
import 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(NetworkInitial()) {
    on<FetchNetworkDetailsEvent>((event, emit) async {
      emit(NetworkLoading());
      
      try {
        // Simulate a delay to mimic network fetching
        await Future.delayed(Duration(seconds: 2));

        // Mocked network data
        emit(NetworkLoaded(
          networkId: event.networkId,
          networkName: 'Elite Leaders Network',
          totalMembers: 120,
          totalEarnings: 45320.50,
          ranking: 'Top 5%',
        ));
      } catch (e) {
        emit(NetworkError('Failed to fetch network details'));
      }
    });
  }
}
