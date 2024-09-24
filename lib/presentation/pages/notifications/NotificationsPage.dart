import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/app_colors.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Map<String, dynamic>> notifications = [];
  int? selectedNotificationIndex;

  @override
  void initState() {
    super.initState();
    _loadNotifications();
  }

  Future<void> _loadNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? notificationsString = prefs.getStringList('notifications');

    if (notificationsString == null || notificationsString.isEmpty) {
      notifications = [
  {
    'title': 'Welcome to the Network!',
    'message':
        'Thank you for joining our MLM platform. Start building your network and unlock rewards!',
    'date': '2024-06-01'
  },
  {
    'title': 'Referral Success',
    'message':
        'Congratulations! Your referral, John Doe, has joined the platform. Keep growing your network.',
    'date': '2024-06-10'
  },
  {
    'title': 'New Earnings',
    'message': 'You have earned \$50 from recent referrals. Check your account for details.',
    'date': '2024-06-15'
  },
  {
    'title': 'Bonus Alert',
    'message': 'Earn double rewards for every new referral this week! Don\'t miss out!',
    'date': '2024-06-17'
  },
  {
    'title': 'Network Milestone',
    'message': 'You’ve reached 50 members in your network. Enjoy an exclusive 10% bonus on your earnings.',
    'date': '2024-06-20'
  },
  {
    'title': 'Special Offer',
    'message': 'Get a 20% discount on your next purchase! Use code SPECIAL20 at checkout.',
    'date': '2024-07-01'
  },
  {
    'title': 'Event Reminder',
    'message': 'Don\'t forget the upcoming webinar on network expansion strategies. Register now!',
    'date': '2024-07-05'
  },
  {
    'title': 'New Feature',
    'message': 'We’ve added new features to your dashboard for better tracking. Check them out!',
    'date': '2024-07-10'
  },
  {
    'title': 'Community Growth',
    'message': 'Your community has grown by 10 new members this month. Keep up the great work!',
    'date': '2024-07-15'
  },
  {
    'title': 'Maintenance Notice',
    'message': 'Scheduled maintenance on July 20th from 2 AM to 4 AM. Please plan accordingly.',
    'date': '2024-07-18'
  }
];

      await _saveNotifications();
    } else {
      setState(() {
        notifications = notificationsString
            .map((notif) => json.decode(notif) as Map<String, dynamic>)
            .toList();
      });
    }
  }

  Future<void> _saveNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notificationsString =
        notifications.map((notif) => json.encode(notif)).toList();
    prefs.setStringList('notifications', notificationsString);
  }

  void _deleteNotification(int index) {
    setState(() {
      notifications.removeAt(index);
      _saveNotifications();
    });
  }

  void _clearSelection() {
    setState(() {
      selectedNotificationIndex = null;
    });
  }

  void _copyMessageToClipboard(int index) {
    Clipboard.setData(
        ClipboardData(text: notifications[index]['message'] ?? 'No Message'));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Message copied to clipboard')),
    );
    _clearSelection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                     title: Text("Notification", style: AppTextStyles.appBartext,),
                     leading: Icon(Icons.arrow_back, color: AppColors.secondary,),
                     backgroundColor: AppColors.primary,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Column(
                            children: [
                              ListTile(
                                title: Text(
                                  notifications[index]['title'] ?? 'No Title',
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  notifications[index]['message'] ?? 'No Message',
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                ),
                                trailing: Text(
                                  notifications[index]['date'] ?? 'No Date',
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                                onLongPress: () {
                                  setState(() {
                                    selectedNotificationIndex = index;
                                  });
                                },
                              ),
                              const Divider(),
                              if (selectedNotificationIndex == index)
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end, // Align icons to the right
                                  children: [
                                    IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        _deleteNotification(index);
                                        _clearSelection();
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.copy),
                                      onPressed: () {
                                        _copyMessageToClipboard(index);
                                      },
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.cancel),
                                      onPressed: _clearSelection,
                                    ),
                                  ],
                                ),
                            ],
                          );
                        },
                        childCount: notifications.length,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _addNotification(String title, String message, String sender) {
    setState(() {
      notifications.add({
        'title': title,
        'message': message,
        'sender': sender,
        'date': DateTime.now().toString(),
        'read': false,
      });
    });
    _saveNotifications();
  }
}
