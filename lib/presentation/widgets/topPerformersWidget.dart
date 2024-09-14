import 'package:flutter/material.dart';

class TopPerformersWidget extends StatelessWidget {
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
                'Top Performers',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile1.jpg'),
                  ),
                  title: Text(
                    'Alice',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('5 Referrals this week'),
                ),
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile2.jpg'),
                  ),
                  title: Text(
                    'Bob',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('4 Referrals this week'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}