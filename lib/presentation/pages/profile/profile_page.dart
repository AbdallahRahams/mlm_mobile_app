import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/app_colors.dart';
import 'package:mlm_mobile_app/text_styles.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight * 0.15,
            backgroundColor: AppColors.primary,
            floating: false,
            pinned: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Profile',
                style: AppTextStyles.heading21.copyWith(
                  fontSize: screenWidth * 0.05, // Responsive title font size
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar with Edit Option
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: screenWidth * 0.15,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          size: screenWidth * 0.15,
                          color: Colors.grey[700],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.camera_alt_outlined, color: Colors.black45, size: 30),
                          onPressed: () {
                            // Handle image upload
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // User name
                  Text(
                    'Your Name Here',
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),

                  // User email
                  Text(
                    'email@example.com',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // Profile details (editable)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    padding: EdgeInsets.all(screenHeight * 0.02),
                    child: Column(
                      children: [
                        _buildEditableRow(Icons.email, "Email", "email@example.com"),
                        _buildEditableRow(Icons.phone, "Mobile", "+255 765 094 XXX"),
                        _buildEditableRow(Icons.person, "Gender", "Male/Female"),
                        _buildEditableRow(Icons.cake, "Date of Birth", "14th Oct, 2XXX"),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // MLM Metrics
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    padding: EdgeInsets.all(screenHeight * 0.02),
                    child: Column(
                      children: [
                        _buildMetricsRow(Icons.group, "Referrals", "25"),
                        _buildMetricsRow(Icons.attach_money, "Total Earnings", "\$1,250"),
                        _buildMetricsRow(Icons.people, "Team Size", "50"),
                        SizedBox(height: screenHeight * 0.02),
                        // Referral Link
                        Text(
                          'Referral Link:',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            // Copy referral link
                          },
                          child: Text(
                            'https://mlm-platform.com/referral/yourusername',
                            style: AppTextStyles.caption,
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            // Show QR code
                          },
                          child: Text(
                            'Show QR Code',
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),

                  // Edit Profile Button
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: SizedBox(
                      width: double.infinity,  // Set button to take full width
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.secondary,
                          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),  // Adjusted padding for responsive button size
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {
                          // Edit profile logic here
                        },
                        child: Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 252, 252, 252),  // Text color
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Back Button at the bottom left
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/home");
        },
        child: Icon(Icons.arrow_back, color: Colors.white),
        backgroundColor: AppColors.primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }

  Widget _buildEditableRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.secondary),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(value, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricsRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColors.secondary),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(value, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
