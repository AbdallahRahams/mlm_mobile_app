import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final String offerTitle;
  final String offerDetails;

  OfferCard({
    required this.offerTitle,
    required this.offerDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(offerTitle, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(offerDetails),
      ),
    );
  }
}
