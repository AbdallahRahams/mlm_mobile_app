import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/app_colors.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

class QRCodeGenerator extends StatefulWidget {
  final String referralLink;
  final String companyName;
  final String companyIconPath;

  const QRCodeGenerator({
    Key? key,
    required this.referralLink,
    required this.companyName,
    required this.companyIconPath,
  }) : super(key: key);

  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  Uint8List? qrCodeImage;

  @override
  void initState() {
    super.initState();
    _generateQRCode();
  }

  Future<void> _generateQRCode() async {
    final qrValidationResult = QrValidator.validate(
      data: widget.referralLink,
      version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.L,
    );

    if (qrValidationResult.status == QrValidationStatus.valid) {
      final painter = QrPainter.withQr(
        qr: qrValidationResult.qrCode!,
        color: const Color(0xFF000000),
        emptyColor: const Color(0xFFFFFFFF),
        gapless: false,
      );

      // Convert the QR painter to an image
      final image = await painter.toImage(300);  // Reduced size of QR code
      final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        setState(() {
          qrCodeImage = byteData.buffer.asUint8List();
        });
      }
    }
  }

  void _showQRCodeDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title "QR Code"
            Text(
              'Scan Code',
              style: AppTextStyles.heading2,  // Style the title text
            ),
            const SizedBox(height: 10),
            // Display QR code image
            if (qrCodeImage != null)
              Stack(
                alignment: Alignment.center,
                children: [
                  // Reduced QR Code image
                  Image.memory(
                    qrCodeImage!,
                    width: 150,
                    height: 150,  // Reduced height for QR code
                  ),
                  /*
                  // White circular container for company logo with padding
                  Positioned(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0), // Adds padding
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3), // Shadow position
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  */
                ],
              ),
            const SizedBox(height: 10),
            // Referral Link
            Text(
              'Referral Link: ${widget.referralLink}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),
            // Share Button
            ElevatedButton.icon(
              onPressed: () => _shareReferralLink(),
              icon: const Icon(Icons.share, color: AppColors.whiteTheme),
              label: const Text(
                'Share Referral Link',
                style: AppTextStyles.button,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _shareReferralLink() {
    Share.share(widget.referralLink);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showQRCodeDialog();
      },
      child: Text(
        'Show QR Code',
        style: TextStyle(
          color: AppColors.primary,
          fontSize: 16,
        ),
      ),
    );
  }
}