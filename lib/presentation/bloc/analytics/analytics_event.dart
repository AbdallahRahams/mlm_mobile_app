abstract class AnalyticsEvent {}

class FetchAnalyticsEvent extends AnalyticsEvent {
  final String analyticsId;

  FetchAnalyticsEvent(this.analyticsId);
}
