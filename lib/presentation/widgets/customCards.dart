import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../app_colors.dart';
import '../../../text_styles.dart';

class CarouselCards extends StatefulWidget {
  final List<Widget> cards;

  CarouselCards({required this.cards});

  @override
  _CarouselCardsState createState() => _CarouselCardsState();
}

class _CarouselCardsState extends State<CarouselCards> {
  PageController _pageController = PageController(viewportFraction: 1.0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 250,
          child: PageView.builder(
            itemCount: widget.cards.length,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return Transform.scale(
                scale: 0.95,
                child: widget.cards[index],
              );
            },
          ),
        ),
        SizedBox(height: 10),
        AnimatedSmoothIndicator(
          activeIndex: _currentPage,
          count: widget.cards.length,
          effect: ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: AppColors.primary, // Light color for active dots
            dotColor: Colors.grey.shade300, // Lighter dots
            expansionFactor: 2.5,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '\$$totalEarnings',
            style: AppTextStyles.heading2.copyWith(color: AppColors.primary, fontSize: 35),
          ),
          Text(
            'Lifetime',
            style: AppTextStyles.bodyText2.copyWith(
              color: Colors.black.withOpacity(0.6), // Changed to darker text
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildEarningsDetail('$commissions', 'Commissions'),
              _divider(),
              _buildEarningsDetail('$bonuses', 'Bonuses'),
              _divider(),
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
          style: AppTextStyles.bodyText1.copyWith(color: Colors.black), // Darker text
        ),
        Text(
          label,
          style: AppTextStyles.bodyText2.copyWith(
            color: Colors.black.withOpacity(0.6), // Darker label
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return Text(
      '|',
      style: TextStyle(color: Colors.black.withOpacity(0.6)), // Dark divider
    );
  }
}

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
                  color: Colors.orangeAccent, // Light mode color
                ),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.orangeAccent, // Light progress color
              backgroundColor: Colors.grey.shade300, // Light background
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${(progress * 100).toStringAsFixed(1)}% to next rank',
                style: AppTextStyles.bodyText2.copyWith(
                  color: Colors.black.withOpacity(0.6), // Darker text
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
      '|',
      style: TextStyle(color: Colors.black.withOpacity(0.6),
      fontWeight: FontWeight.w500,), // Dark divider
      
    ),
              Text(
                '∼ ${(progress) * 200} Points',
                style: AppTextStyles.bodyText2.copyWith(
                  color: Colors.black.withOpacity(0.6), // Darker text
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            level,
            style: AppTextStyles.heading2.copyWith(color: Colors.black), // Darker text
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNetworkDetail('$downlines', 'Downlines'),
              _divider(),
              _buildNetworkDetail('$uplines', 'Uplines'),
              _divider(),
              _buildNetworkDetail('$totalInNetwork', 'Network'),
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
          style: AppTextStyles.bodyText1.copyWith(color: Colors.black), // Darker text
        ),
        Text(
          label,
          style: AppTextStyles.bodyText2.copyWith(
            color: Colors.black.withOpacity(0.6), // Darker label
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return Text(
      '|',
      style: TextStyle(color: Colors.black.withOpacity(0.6),
      fontWeight: FontWeight.w500,), // Dark divider
      
    );
  }
}

class CustomCard extends StatelessWidget {
  final String title;
  final Widget child;

  CustomCard({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white, // Light background for cards
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
          Text(
            title,
            style: AppTextStyles.heading3.copyWith(
              color: Colors.black, // Darker text for titles
              fontSize: 30,
            ),
          ),
          SizedBox(height: 15),
          Expanded(child: child),
        ],
      ),
    );
  }
}