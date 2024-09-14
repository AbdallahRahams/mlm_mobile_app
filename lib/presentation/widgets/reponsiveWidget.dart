import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final String title;
  final String content;

  const ResponsiveWidget({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14, // Adjust font size based on screen
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(content),
        ],
      ),
    );
  }
}
