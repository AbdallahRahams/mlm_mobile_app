import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlm_mobile_app/presentation/widgets/drawer.dart';
import 'package:mlm_mobile_app/presentation/widgets/reponsiveWidget.dart';
import 'package:path/path.dart';
import '../../../app_colors.dart';
import '../../../text_styles.dart';
import '../../bloc/home/home_bloc.dart';
import '../../bloc/home/home_event.dart';
import '../../widgets/currentRankWidget.dart';
import 'modernBottomBar.dart';

class HomePage extends StatelessWidget {
  String username = "Username";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadHomePageDataEvent()),
      child: Scaffold(
        backgroundColor: AppColors.primary, // Set background to black
        drawer: DrawerWidget(),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top section containing greeting and icons

                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 12.0), // Reduced padding
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Greeting Text with Verification Badge
                        Row(
                          children: [
                            Text(
                              'Hello, ${username.length > 5 ? username.substring(0, 5) + '...' : username}',
                              style: AppTextStyles.heading2
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(width: 4), // Reduced spacing
                            Icon(Icons.verified_rounded,
                                size: 18,
                                color: AppColors
                                    .secondary), // Slightly smaller icon
                          ],
                        ),
                        // Notification and Menu Icons
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.notifications,
                                  color: Colors.white,
                                  size: 30), // Reduced icon size
                              onPressed: () {
                                Navigator.pushNamed(context, "/notifications");
                              },
                            ),
                            Builder(
                              builder: (BuildContext context) {
                                return IconButton(
                                  icon: Icon(Icons.menu, color: Colors.white),
                                  onPressed: () {
                                    Scaffold.of(context)
                                        .openDrawer(); // Open the drawer
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
// Current Rank Widget
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12), // Reduced padding
                    child: CurrentRankWidget(),
                  ),

                  SizedBox(height: 20),
                  // Rest of the page content in a rounded container
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                // Horizontal line separator
                                ResponsiveWidget(
                                    title: "Title 1",
                                    content:
                                        "This is the content for widget 1."),
                                _buildHorizontalLine(),
                                ResponsiveWidget(
                                    title: "Title 2",
                                    content:
                                        "This is the content for widget 2."),
                                _buildHorizontalLine(),
                                ResponsiveWidget(
                                    title: "Title 3",
                                    content:
                                        "This is the content for widget 3."),
                                _buildHorizontalLine(),
                                ResponsiveWidget(
                                    title: "Title 4",
                                    content:
                                        "This is the content for widget 4."),
                                _buildHorizontalLine(),
                                ResponsiveWidget(
                                    title: "Title 5",
                                    content:
                                        "This is the content for widget 5."),
                                _buildHorizontalLine(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: ModernBottomNavBar(),
      ),
    );
  }

  Widget _buildHorizontalLine() {
    return Divider(
      color: Colors.grey.shade300,
      thickness: 1,
      height: 20,
    );
  }
}