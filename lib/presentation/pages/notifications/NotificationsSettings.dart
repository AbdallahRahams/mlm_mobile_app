import 'package:flutter/material.dart';
import 'package:mlm_mobile_app/app_colors.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool enableAllNotifications = true;
  bool enableSystemUpdates = true;
  bool enableOffers = true;
  bool enableReminders = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      enableAllNotifications = prefs.getBool('enableAllNotifications') ?? true;
      enableSystemUpdates = prefs.getBool('enableSystemUpdates') ?? true;
      enableOffers = prefs.getBool('enableOffers') ?? true;
      enableReminders = prefs.getBool('enableReminders') ?? true;
    });
  }

  Future<void> _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('enableAllNotifications', enableAllNotifications);
    prefs.setBool('enableSystemUpdates', enableSystemUpdates);
    prefs.setBool('enableOffers', enableOffers);
    prefs.setBool('enableReminders', enableReminders);
  }

  Widget _buildSwitch(String title, String subtitle, bool value, ValueChanged<bool> onChanged) {
    return SwitchListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontSize: 14, color: Colors.black54),
      ),
      value: value,
      onChanged: onChanged,
      inactiveTrackColor: const Color.fromARGB(255, 234, 232, 232),
      activeColor: AppColors.primary,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(
        title: Text(
          "Notification Settings",
          style: AppTextStyles.appBartext.copyWith(color: AppColors.primary),
        ),
        backgroundColor: AppColors.whiteTheme,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.primary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSwitch(
              "Enable All Notifications",
              "Toggle to enable or disable all notifications.",
              enableAllNotifications,
              (value) {
                setState(() {
                  enableAllNotifications = value;
                  if (!value) {
                    enableSystemUpdates = false;
                    enableOffers = false;
                    enableReminders = false;
                  }
                });
                _saveSettings();
              },
            ),
            _buildSwitch(
              "System Updates",
              "Receive notifications about system updates.",
              enableSystemUpdates && enableAllNotifications,
              (value) {
                if (enableAllNotifications) {
                  setState(() {
                    enableSystemUpdates = value;
                  });
                  _saveSettings();
                }
              },
            ),
            _buildSwitch(
              "Offers and Promotions",
              "Receive notifications about new offers and promotions.",
              enableOffers && enableAllNotifications,
              (value) {
                if (enableAllNotifications) {
                  setState(() {
                    enableOffers = value;
                  });
                  _saveSettings();
                }
              },
            ),
            _buildSwitch(
              "Reminders",
              "Receive reminders about important events or tasks.",
              enableReminders && enableAllNotifications,
              (value) {
                if (enableAllNotifications) {
                  setState(() {
                    enableReminders = value;
                  });
                  _saveSettings();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
