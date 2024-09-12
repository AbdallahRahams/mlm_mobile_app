class EarningsModel {
  final String userId;
  final double totalEarnings;
  final double monthlyEarnings;

  EarningsModel({
    required this.userId,
    required this.totalEarnings,
    required this.monthlyEarnings,
  });

  // Factory constructor to create an EarningsModel instance from a Map (used by SQLite)
  factory EarningsModel.fromMap(Map<String, dynamic> map) {
    return EarningsModel(
      userId: map['userId'],
      totalEarnings: map['totalEarnings'],
      monthlyEarnings: map['monthlyEarnings'],
    );
  }

  // Method to convert EarningsModel to a Map (used by SQLite)
  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'totalEarnings': totalEarnings,
      'monthlyEarnings': monthlyEarnings,
    };
  }

  // Factory constructor to create an EarningsModel instance from JSON
  factory EarningsModel.fromJson(Map<String, dynamic> json) {
    return EarningsModel(
      userId: json['userId'],
      totalEarnings: json['totalEarnings'],
      monthlyEarnings: json['monthlyEarnings'],
    );
  }

  // Method to convert EarningsModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'totalEarnings': totalEarnings,
      'monthlyEarnings': monthlyEarnings,
    };
  }
}