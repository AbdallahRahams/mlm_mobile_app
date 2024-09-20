import 'package:flutter/material.dart';

import '../../../app_colors.dart';

class TopPerformersPage extends StatelessWidget {
  final List<Map<String, dynamic>> performers = [
    {"name": "Alice", "points": 3000},
    {"name": "Bob", "points": 2500},
    {"name": "Charlie", "points": 2000},
    {"name": "David", "points": 1500},
    {"name": "Eve", "points": 1000},
    {"name": "Zara", "points": 900},
    {"name": "Oscar", "points": 800},
    {"name": "John", "points": 700},
    {"name": "Alex", "points": 600},
    {"name": "CurrentUser", "points": 100},
  ];

  final String currentUser = "CurrentUser"; // Example current user

  @override
  Widget build(BuildContext context) {
    // Sort performers by points in descending order
    final sortedPerformers = List<Map<String, dynamic>>.from(performers)
      ..sort((a, b) => b['points'].compareTo(a['points']));

    // Get the current user's points
    final currentUserData = performers.firstWhere(
      (performer) => performer['name'] == currentUser,
      orElse: () => {"points": 0},
    );
    int currentUserPoints = currentUserData["points"];
    
    // Determine the title based on points, not rank
    String userRankTitle = getRankTitle(currentUserPoints);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Performers'),
        backgroundColor: const Color.fromARGB(255, 254, 253, 248),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Top 5 Performers',
              style: TextStyle(
                fontSize: 26, 
                fontWeight: FontWeight.bold, 
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: 5, // Show only top 5
                itemBuilder: (context, index) {
                  final performer = sortedPerformers[index];
                  bool isInitialsOnly = index >= 3; // 4th and 5th users
                  return PerformerTile(
                    performer: performer,
                    isCurrentUser: performer["name"] == currentUser,
                    rank: index + 1,
                    rankTitle: getRankTitle(performer["points"]), // Title based on points
                    initialsOnly: isInitialsOnly, // Show initials for 4th and 5th
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Position:',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold, 
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Title: $userRankTitle',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You have $currentUserPoints points.',
              style: const TextStyle(
                fontSize: 18, 
                color: AppColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to determine the rank title based on points
  String getRankTitle(int points) {
    if (points >= 3000) {
      return "Elite";
    } else if (points >= 2000) {
      return "Diamond";
    } else if (points >= 1000) {
      return "Platinum";
    } else if (points >= 500) {
      return "Gold";
    } else if (points >= 200) {
      return "Bronze";
    } else {
      return "Starter";
    }
  }
}

class PerformerTile extends StatelessWidget {
  final Map<String, dynamic> performer;
  final bool isCurrentUser;
  final int rank;
  final String rankTitle;
  final bool initialsOnly;

  const PerformerTile({
    Key? key,
    required this.performer,
    required this.isCurrentUser,
    required this.rank,
    required this.rankTitle,
    required this.initialsOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define rank badges
    String rankBadge;
    Color badgeColor;

    switch (rank) {
      case 1:
        rankBadge = '🥇';
        badgeColor = AppColors.secondary;
        break;
      case 2:
        rankBadge = '🥈';
        badgeColor = AppColors.primary1;
        break;
      case 3:
        rankBadge = '🥉';
        badgeColor = Colors.brown;
        break;
      default:
        rankBadge = '';
        badgeColor = AppColors.backgroundLight;
    }

    // Use initials if initialsOnly is true
    String displayName = initialsOnly
        ? performer["name"][0].toUpperCase() // Show initials for 4th and 5th performers
        : performer["name"];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: rank == 1
            ? const LinearGradient(
                colors: [AppColors.primary, AppColors.accent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,
        color: isCurrentUser ? AppColors.primary.withOpacity(0.1) : AppColors.background,
        border: Border.all(color: isCurrentUser ? AppColors.primary : Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Rank Badge
              if (rank <= 3)
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: badgeColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    rankBadge,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              const SizedBox(width: 12),
              // Performer Name and Rank Title
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    displayName,
                    style: TextStyle(
                      fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.normal,
                      fontSize: 18,
                      color: isCurrentUser ? AppColors.primary : AppColors.text,
                    ),
                  ),
                  if (!initialsOnly)
                    Text(
                      rankTitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.text,
                      ),
                    ),
                ],
              ),
            ],
          ),
          // Performer Points
          Text(
            '${performer["points"]} pts',
            style: TextStyle(
              fontWeight: isCurrentUser ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
              color: isCurrentUser ? AppColors.primary : AppColors.text,
            ),
          ),
        ],
      ),
    );
  }
}
