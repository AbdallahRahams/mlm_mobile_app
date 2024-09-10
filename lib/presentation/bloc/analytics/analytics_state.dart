abstract class AnalyticsState {}

class AnalyticsInitial extends AnalyticsState {}

class AnalyticsLoading extends AnalyticsState {}

class AnalyticsLoaded extends AnalyticsState {
  final String analyticsId;

  AnalyticsLoaded({required this.analyticsId});
}

class AnalyticsError extends AnalyticsState {
  final String message;

  AnalyticsError(this.message);
}
