import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import '../../../app_colors.dart';

class NetworkPage extends StatelessWidget {
  final int totalDownlines = 25;
  final int invitesSent = 15;

  final List<Downline> downlines = [
    Downline('John Doe', 1),
    Downline('Jane Smith', 2),
    Downline('Alex Johnson', 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Network',
          style: AppTextStyles.appBartext,
        ),
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.secondary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // KPIs section with spacing and padding
                _buildKpiSection(),
                SizedBox(height: 30),

                // Downline section header with enhanced font and padding
                Text(
                  'Your Downlines',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),
                SizedBox(height: 15),

                // Display downline members
                _buildDownlineList(),
                SizedBox(height: 30),

                // Invite Button with padding and elevation for better UX
                Center(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      elevation: 5,
                    ),
                    onPressed: () {
                      try {
                        Navigator.pushNamed(context, '/invite');
                      } catch (e) {
                        _showErrorDialog(context, 'Failed to invite member: $e');
                      }
                    },
                    icon: Icon(Iconsax.user_add, color: Colors.white),
                    label: Text(
                      'Invite Member',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // KPI Section with padding and a clean layout
  Widget _buildKpiSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildKpiItem('Total Downlines', totalDownlines.toString(), Iconsax.people),
        _buildKpiItem('Invitations Sent', invitesSent.toString(), Iconsax.send_1),
      ],
    );
  }

  // KPI Helper Widget
  Widget _buildKpiItem(String title, String value, IconData icon) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Icon(icon, size: 32, color: AppColors.primary),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.text),
            ),
            SizedBox(height: 5),
            Text(
              value,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Enhanced Downline List
  Widget _buildDownlineList() {
    return Column(
      children: downlines.isNotEmpty
          ? downlines.map((downline) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Icon(Iconsax.user, color: AppColors.primary, size: 28),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            downline.name,
                            style: TextStyle(fontSize: 16, color: AppColors.text),
                          ),
                          Text(
                            'Level: ${downline.level}',
                            style: TextStyle(color: AppColors.text.withOpacity(0.7)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList()
          : [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No downlines available.',
                  style: TextStyle(color: AppColors.text, fontSize: 16),
                ),
              ),
            ],
    );
  }

  // Method to show error dialog
  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


// Downline model (updated without earnings)
class Downline {
  final String name;
  final int level;

  Downline(this.name, this.level);
}
