import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:share/share.dart';
import '../../app_colors.dart';

class ReferralLinkWidget extends StatelessWidget {
  final String referralLink = "https://yourapp.com/referral/12345";
  final String referralCode = "12345";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showReferralModal(context),
      child: Icon(
        size: 60,  // Reduced size
        Icons.qr_code_scanner_rounded,  
        color: Colors.white,
      ),
    );
  }

  void _showReferralModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),  // Reduced padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PrettyQr(
                data: referralLink,
                size: 120,  // Reduced QR size
                roundEdges: true,
                elementColor: Colors.black,
              ),
              SizedBox(height: 10),
              Text(
                'Referral Code: $referralCode',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),  // Smaller text
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: referralLink));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Referral link copied to clipboard')),
                      );
                    },
                    icon: Icon(Icons.copy, color: AppColors.secondary),
                    label: Text('Copy Code', style: TextStyle(color: AppColors.secondary)),
                    style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: Colors.transparent,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Share.share('Check out this referral link: $referralLink');
                    },
                    icon: Icon(Icons.share, color: AppColors.secondary),
                    label: Text('Share', style: TextStyle(color: AppColors.secondary)),
                    style: ElevatedButton.styleFrom(
                      elevation: 0, backgroundColor: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
