class Earnings {
  final String userId;
  final double totalEarnings;
  final double pendingEarnings;
  final double withdrawnEarnings;

  Earnings({
    required this.userId,
    required this.totalEarnings,
    required this.pendingEarnings,
    required this.withdrawnEarnings,
  });

  factory Earnings.fromJson(Map<String, dynamic> json) {
    return Earnings(
      userId: json['userId'],
      totalEarnings: json['totalEarnings'],
      pendingEarnings: json['pendingEarnings'],
      withdrawnEarnings: json['withdrawnEarnings'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'totalEarnings': totalEarnings,
      'pendingEarnings': pendingEarnings,
      'withdrawnEarnings': withdrawnEarnings,
    };
  }
}
