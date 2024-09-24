import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mlm_mobile_app/presentation/widgets/drawer.dart';
import 'package:mlm_mobile_app/presentation/widgets/greetingHeader.dart';
import 'package:mlm_mobile_app/presentation/widgets/motivationQuotes.dart';
import 'package:mlm_mobile_app/presentation/widgets/quickActions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/presentation/widgets/serviceOverview.dart';
import '../../../app_colors.dart';
import '../../../data/models/task.dart';
import '../../../text_styles.dart';
import '../../bloc/home/home_bloc.dart';
import '../../bloc/home/home_event.dart';
import '../../widgets/currentRankWidget.dart';
import '../../widgets/customCards.dart';
import '../../widgets/latest_news.dart';
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

   final List<String> newsItems = [
    'Company hits new milestone!',
    'New product launches this week!',
    'Upcoming training event for all distributors',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc()..add(LoadHomePageDataEvent()),
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F6FC),
        drawer: DrawerWidget(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              GreetingHeader(username: username),
              
              // Current Rank Widget (Fixed at the top)
              /*
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: CurrentRankWidget(),
              ),
              */

              // Expanded Scrollable Section
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      
                      // Carousel Cards (Scrolls)
                      CarouselCards(
                        cards: [
                          EarningsCard(
                            totalEarnings: 100.0,
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

                      QuickActionsWidget(),
                      
                      // Task Overview Section (Scrolls)  ServicesOverviewWidget(), LatestNewsSection(newsTitles: newsItems),
                      
                      const SizedBox(height: 20),

                      // Services Overview Section (Scrolls)
                      
                      TaskOverviewWidget(),

                      const SizedBox(height: 20),

                      /*
                      // Training Overview Section (Scrolls)
                      TrainingOverviewWidget(
                        trainings: [
                          Training(title: "MLM Marketing Basics", date: "2024-09-25", status: "Upcoming"),
                          Training(title: "Advanced Sales Techniques", date: "2024-09-15", status: "Completed"),
                          Training(title: "Social Media Strategies", date: "2024-10-01", status: "Upcoming"),
                        ],
                      ),
                      */

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