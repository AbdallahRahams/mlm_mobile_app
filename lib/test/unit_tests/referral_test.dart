import 'package:flutter_test/flutter_test.dart';
import 'package:your_project/data/models/referral_model.dart'; // Update with actual import path
import 'package:your_project/domain/entities/referral.dart'; // Update with actual import path

void main() {
  group('ReferralModel', () {
    test('should convert from entity to model and vice versa', () {
      final referralEntity = Referral(
        id: '1',
        referrer: 'John Doe',
        referralCode: 'ABC123',
      );

      final referralModel = ReferralModel.fromEntity(referralEntity);
      final newReferralEntity = referralModel.toEntity();

      expect(newReferralEntity.id, referralEntity.id);
      expect(newReferralEntity.referrer, referralEntity.referrer);
      expect(newReferralEntity.referralCode, referralEntity.referralCode);
    });
  });
}