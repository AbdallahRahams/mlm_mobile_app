import 'package:flutter/material.dart';

class TaskListWidget extends StatelessWidget {
  final List<String> tasks = [
    "Invite 2 new members",
    "Complete onboarding tutorial",
    "Share referral link",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Tasks for Today',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Column(
              children: tasks
                  .map((task) => CheckboxListTile(
                        title: Text(task),
                        value: false, // Handle state properly in your app
                        onChanged: (bool? value) {
                          // Handle task completion logic
                        },
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}