class ReferralModel {
  final String userId;
  final int referralCount;

  ReferralModel({
    required this.userId,
    required this.referralCount,
  });

  factory ReferralModel.fromJson(Map<String, dynamic> json) {
    return ReferralModel(
      userId: json['userId'],
      referralCount: json['referralCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'referralCount': referralCount,
    };
  }
}
