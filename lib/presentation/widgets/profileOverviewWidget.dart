import 'package:flutter/material.dart';

class ProfileOverviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/profile.jpg'), // Dummy image
          ),
          title: Text(
            'John Doe',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          subtitle: Text('Rank: Gold'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            // Navigate to profile details
          },
        ),
      ),
    );
  }
}
