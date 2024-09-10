import 'package:bloc/bloc.dart';
import 'referral_event.dart';
import 'referral_state.dart';

class ReferralBloc extends Bloc<ReferralEvent, ReferralState> {
  ReferralBloc() : super(ReferralInitial()) {
    on<FetchReferralDataEvent>((event, emit) {
      emit(ReferralLoading());
      // Fetch referral data logic
      emit(ReferralLoaded(referralId: event.userId));
    });
  }
}
