class Referral {
  final String userId;
  final int referralCount;
  final double referralBonus;

  Referral({
    required this.userId,
    required this.referralCount,
    required this.referralBonus,
  });

  factory Referral.fromJson(Map<String, dynamic> json) {
    return Referral(
      userId: json['userId'],
      referralCount: json['referralCount'],
      referralBonus: json['referralBonus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'referralCount': referralCount,
      'referralBonus': referralBonus,
    };
  }
}
