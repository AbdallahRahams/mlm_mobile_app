import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../app_colors.dart';
import '../../../text_styles.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    CarouselCards(
                      cards: [
                        EarningsCard(
                          totalEarnings: 1250.75,
                          commissions: 45,
                          bonuses: 30,
                          sales: 120,
                        ),
                        RankProgressCard(
                          rank: 'Silver',
                          progress: 0.65,
                        ),
                        NetworkCard(
                          level: 'Level 3',
                          downlines: 120,
                          uplines: 30,
                          totalInNetwork: 151,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Carousel Cards
class CarouselCards extends StatelessWidget {
  final List<Widget> cards;

  CarouselCards({required this.cards});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: PageView.builder(
        itemCount: cards.length,
        controller: PageController(viewportFraction: 0.85),
        itemBuilder: (context, index) {
          return Transform.scale(
            scale: 0.95,
            child: cards[index],
          );
        },
      ),
    );
  }
}

// Earnings Card
class EarningsCard extends StatelessWidget {
  final double totalEarnings;
  final int commissions;
  final int bonuses;
  final int sales;

  EarningsCard({
    required this.totalEarnings,
    required this.commissions,
    required this.bonuses,
    required this.sales,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Earnings',
      icon: Iconsax.money_34,
      description: '',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$$totalEarnings',
            style: AppTextStyles.heading2.copyWith(color: AppColors.secondary),
          ),
          Text(
            'Lifetime',
            style: AppTextStyles.bodyText2
                .copyWith(color: Colors.white.withOpacity(0.6)),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildEarningsDetail('$commissions', 'Commissions'),
              Text('|', style: TextStyle(color: Colors.white.withOpacity(0.6))),
              _buildEarningsDetail('$bonuses', 'Bonuses'),
              Text('|', style: TextStyle(color: Colors.white.withOpacity(0.6))),
              _buildEarningsDetail('$sales', 'Sales'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEarningsDetail(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.bodyText1.copyWith(color: Colors.white),
        ),
        Text(
          label,
          style: AppTextStyles.bodyText2
              .copyWith(color: Colors.white.withOpacity(0.6)),
        ),
      ],
    );
  }
}

// Rank Progress Card
class RankProgressCard extends StatelessWidget {
  final String rank;
  final double progress;

  RankProgressCard({
    required this.rank,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Rank Progress',
      icon: Iconsax.medal_star,
      description: '',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 10.0,
              animation: true,
              percent: progress,
              center: Text(
                "${(progress * 100).toStringAsFixed(1)}%",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color(0xFFFFD700)),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: const Color(0xFFFFD700),
               backgroundColor: Colors.transparent,//const Color.fromARGB(255, 146, 145, 145), // Optional background color
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${(progress * 100).toStringAsFixed(1)}% to next rank',
                style: AppTextStyles.bodyText2
                    .copyWith(color: Colors.white.withOpacity(0.6)),
              ),
              Text('|', style: TextStyle(color: Colors.white.withOpacity(0.6))),
              Text(
                '∼ ${(progress) * 200} Points',
                style: AppTextStyles.bodyText2
                    .copyWith(color: Colors.white.withOpacity(0.6)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Network Card
class NetworkCard extends StatelessWidget {
  final String level;
  final int downlines;
  final int uplines;
  final int totalInNetwork;

  NetworkCard({
    required this.level,
    required this.downlines,
    required this.uplines,
    required this.totalInNetwork,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Network',
      icon: Iconsax.hierarchy_square,
      description: '',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            level,
            style: AppTextStyles.heading2.copyWith(color: Colors.white),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNetworkDetail('$downlines', 'Downlines'),
              Text('|', style: TextStyle(color: Colors.white.withOpacity(0.6))),
              _buildNetworkDetail('$uplines', 'Uplines'),
              Text('|', style: TextStyle(color: Colors.white.withOpacity(0.6))),
              _buildNetworkDetail('$totalInNetwork', 'Network')
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNetworkDetail(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: AppTextStyles.bodyText1.copyWith(color: Colors.white),
        ),
        Text(
          label,
          style: AppTextStyles.bodyText2
              .copyWith(color: Colors.white.withOpacity(0.6)),
        ),
      ],
    );
  }
}

// Reusable CustomCard widget
class CustomCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String description;
  final Widget child;

  CustomCard({
    required this.title,
    required this.icon,
    required this.description,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: AppColors.accent,
                size: 40,
              ),
              SizedBox(width: 15),
              Text(
                title,
                style: AppTextStyles.heading3.copyWith(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          Expanded(child: child),
        ],
      ),
    );
  }
}
