import 'package:bloc/bloc.dart';
import 'wholesaler_event.dart';
import 'wholesaler_state.dart';

class WholesalerBloc extends Bloc<WholesalerEvent, WholesalerState> {
  WholesalerBloc() : super(WholesalerInitial()) {
    on<VerifyWholesalerEvent>((event, emit) {
      emit(WholesalerLoading());
      // Verify wholesaler logic
      emit(WholesalerVerified(wholesalerId: event.wholesalerId));
    });
  }
}
