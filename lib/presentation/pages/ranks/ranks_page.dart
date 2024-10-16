import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/app_colors.dart';
import 'package:mlm_mobile_app/text_styles.dart';

class RanksPage extends StatefulWidget {
  const RanksPage({super.key});

  @override
  State<RanksPage> createState() => _RanksPageState();
}

class _RanksPageState extends State<RanksPage> {
  final List<Map<String, dynamic>> ranks = [
    {
      "name": "Starter",
      "requiredPoints": 0,
      "qualifications": [
        "Just sign up and pay the entry fee",
      ],
      "privileges": [
        "Access to starter kit",
        "Basic support",
      ],
      "rankColor": Colors.green,
    },
    {
      "name": "Bronze",
      "requiredPoints": 500,
      "qualifications": [
        "50 Successful Referrals",
      ],
      "privileges": [
        "Access to basic product line",
        "Personalized dashboard",
      ],
      "rankColor": Colors.brown,
    },
    {
      "name": "Gold",
      "requiredPoints": 1500,
      "qualifications": [
        "75 Successful Referrals",
      ],
      "privileges": [
        "Access to all products",
        "Sales commission boost",
        "Exclusive training resources",
        "Verified Badge",
      ],
      "rankColor": Colors.amber,
    },
    {
      "name": "Platinum",
      "requiredPoints": 3000,
      "qualifications": [
        "100 Successful Referrals",
      ],
      "privileges": [
        "Priority support",
        "Exclusive events access",
        "Higher commission rates",
        "Special product discounts",
      ],
      "rankColor": Colors.grey,
    },
    {
      "name": "Diamond",
      "requiredPoints": 5000,
      "qualifications": [
        "200 Successful Referrals",
      ],
      "privileges": [
        "Direct mentorship",
        "Full commission rates",
        "Invitation to leadership summits",
        "Special bonuses",
      ],
      "rankColor": Colors.blueAccent,
    },
    {
      "name": "Elite",
      "requiredPoints": 10000,
      "qualifications": [
        "500 Successful Referrals",
      ],
      "privileges": [
        "Top-tier mentorship",
        "Exclusive global events",
        "Maximum commissions",
        "Executive-level bonuses",
        "Partnership opportunities",
      ],
      "rankColor": Colors.deepPurpleAccent,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Ranks',
          style: AppTextStyles.appBartext.copyWith(fontSize: 27, color: AppColors.primary), // Responsive title font
        ),
        centerTitle: true,
        backgroundColor: AppColors.whiteTheme,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: ranks.map((rank) => RankTile(rank: rank)).toList(),
          ),
        ),
      ),
    );
  }
}

class RankTile extends StatelessWidget {
  final Map<String, dynamic> rank;

  const RankTile({Key? key, required this.rank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(66, 210, 210, 210),
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  rank["name"],
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: rank["rankColor"],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (rank["requiredPoints"] > 0) ...[
            Text(
              'Points Needed: ${rank["requiredPoints"]}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 10),
          ],
          Text(
            'Qualifications:',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          ...rank["qualifications"].map<Widget>((qualification) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.check, color: Colors.teal, size: 18),
                    const SizedBox(width: 8),
                    Flexible(child: Text(qualification)),
                  ],
                ),
              )),
          const SizedBox(height: 10),
          Text(
            'Privileges:',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 5),
          ...rank["privileges"].map<Widget>((privilege) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.star_outline, color: Colors.teal, size: 18),
                    const SizedBox(width: 8),
                    Flexible(child: Text(privilege)),
                  ],
                ),
              )),
          const Divider(height: 40, thickness: 1),
        ],
      ),
    );
  }
}