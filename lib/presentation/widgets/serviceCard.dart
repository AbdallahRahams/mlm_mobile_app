import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String description;
  final String? companyName;  // Make companyName nullable
  final double? rating;       // Make rating nullable
  final String? price;        // Make price nullable
  final VoidCallback onTap;

  const ServiceCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.description,
    this.companyName,       // Nullable in constructor
    this.rating,            // Nullable in constructor
    this.price,             // Nullable in constructor
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      elevation: 5,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (companyName != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      companyName!,
                      style: Theme.of(context).textTheme.titleSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  if (rating != null) ...[
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 16),
                        Text(' $rating', style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                  ],
                  if (price != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      price!,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.green),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
