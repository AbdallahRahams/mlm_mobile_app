import 'package:flutter/material.dart';

class ReferralCountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.people, color: Colors.blue, size: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Referrals',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                '27 Active Referrals',
                style: TextStyle(color: Colors.grey[700]),
              ),
            ],
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}