class EarningsModel {
  final String userId;
  final double totalEarnings;
  final double monthlyEarnings;

  EarningsModel({
    required this.userId,
    required this.totalEarnings,
    required this.monthlyEarnings,
  });

  factory EarningsModel.fromJson(Map<String, dynamic> json) {
    return EarningsModel(
      userId: json['userId'],
      totalEarnings: json['totalEarnings'],
      monthlyEarnings: json['monthlyEarnings'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'totalEarnings': totalEarnings,
      'monthlyEarnings': monthlyEarnings,
    };
  }
}
