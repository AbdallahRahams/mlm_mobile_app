import 'package:bloc/bloc.dart';
import 'earnings_event.dart';
import 'earnings_state.dart';

class EarningsBloc extends Bloc<EarningsEvent, EarningsState> {
  EarningsBloc() : super(EarningsInitial()) {
    on<FetchEarningsEvent>((event, emit) async {
      emit(EarningsLoading());
      try {
        // Fetch earnings logic
        emit(EarningsLoaded(earningsId: event.userId));
      } catch (e) {
        emit(EarningsError("Failed to fetch earnings"));
      }
    });
  }
}
