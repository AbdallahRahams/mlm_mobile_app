import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlm_mobile_app/presentation/widgets/drawer.dart';
import 'package:mlm_mobile_app/presentation/widgets/motivationQuotes.dart';
import 'package:mlm_mobile_app/presentation/widgets/quickActions.dart';
import 'package:mlm_mobile_app/presentation/widgets/reponsiveWidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/presentation/widgets/serviceOverview.dart';
import '../../../app_colors.dart';
import '../../../data/models/task.dart';
import '../../../text_styles.dart';
import '../../bloc/home/home_bloc.dart';
import '../../bloc/home/home_event.dart';
import '../../widgets/currentRankWidget.dart';
import '../../widgets/customCards.dart';
import '../../widgets/taskOverview.dart';
import '../../widgets/trainingOverview.dart';
import 'modernBottomBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "Username";
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadHomePageDataEvent()),
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: DrawerWidget(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top section containing greeting and icons (Fixed at the top)
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 12.0, right: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Hi, ',
                                style: AppTextStyles.heading2.copyWith(
                                  color: AppColors.secondary,
                                  fontSize: 35,
                                ),
                              ),
                              TextSpan(
                                text: '${username.length > 8 ? username.substring(0, 8) + '...' : username}',
                                style: AppTextStyles.heading2.copyWith(
                                  color: Colors.black,
                                  fontSize: 35,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Iconsax.verify5,
                          size: 25,
                          color: AppColors.secondary,
                        ),
                      ],
                    ),
                    Builder(
                      builder: (BuildContext context) {
                        return IconButton(
                          icon: Icon(
                            Icons.menu_rounded,
                            color: Colors.black,
                            size: 35,
                          ),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),

              // Current Rank Widget (Fixed at the top)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: CurrentRankWidget(),
              ),

              // Expanded Scrollable Section
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Carousel Cards (Scrolls)
                      CarouselCards(
                        cards: [
                          EarningsCard(
                            totalEarnings: 12345.0,
                            commissions: 20,
                            bonuses: 15,
                            sales: 8,
                          ),
                          RankProgressCard(
                            rank: "Gold",
                            progress: 0.75, // 75% to next rank
                          ),
                          NetworkCard(
                            level: "Level 3",
                            downlines: 50,
                            uplines: 5,
                            totalInNetwork: 120,
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),
                      
                      // Task Overview Section (Scrolls)
                      ServicesOverviewWidget(),
                      
                      const SizedBox(height: 20),

                      // Services Overview Section (Scrolls)
                      
                      TaskOverviewWidget(),

                      const SizedBox(height: 20),

                      // Training Overview Section (Scrolls)
                      TrainingOverviewWidget(
                        trainings: [
                          Training(title: "MLM Marketing Basics", date: "2024-09-25", status: "Upcoming"),
                          Training(title: "Advanced Sales Techniques", date: "2024-09-15", status: "Completed"),
                          Training(title: "Social Media Strategies", date: "2024-10-01", status: "Upcoming"),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Optional: Motivational Quotes
                      // MotivationalQuotesWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: ModernBottomNavBar(),
      ),
    );
  }

  Widget _buildHorizontalLine() {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8, // 80% of screen width
        child: Divider(
          color: Colors.grey.shade200, // Lighter color for lower contrast
          thickness: 2, // Thicker line
          height: 20,
        ),
      ),
    );
  }
}