class AnalyticsModel {
  final String analyticsId;
  final Map<String, dynamic> data;
  final DateTime generatedAt;

  AnalyticsModel({
    required this.analyticsId,
    required this.data,
    required this.generatedAt,
  });

  factory AnalyticsModel.fromJson(Map<String, dynamic> json) {
    return AnalyticsModel(
      analyticsId: json['analyticsId'],
      data: json['data'],
      generatedAt: DateTime.parse(json['generatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'analyticsId': analyticsId,
      'data': data,
      'generatedAt': generatedAt.toIso8601String(),
    };
  }
}
