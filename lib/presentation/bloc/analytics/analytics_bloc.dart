import 'package:bloc/bloc.dart';
import 'analytics_event.dart';
import 'analytics_state.dart';

class AnalyticsBloc extends Bloc<AnalyticsEvent, AnalyticsState> {
  AnalyticsBloc() : super(AnalyticsInitial()) {
    on<FetchAnalyticsEvent>((event, emit) {
      emit(AnalyticsLoading());
      // Fetch analytics data logic
      emit(AnalyticsLoaded(analyticsId: event.analyticsId));
    });
  }
}
