import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ServicesPage extends StatelessWidget {
  final List<Service> services = [
    Service(
      title: 'Software Development',
      description: 'Custom software solutions tailored to meet your business needs.',
      price: '\$1000',
      icon: Icons.code,
      details: 'Cross-platform development, Agile methodology, Maintenance.',
    ),
    Service(
      title: 'SEO',
      description: 'Maximize your online visibility with our expert SEO services.',
      price: '\$500',
      icon: Icons.search,
      details: 'Keyword research, Technical SEO auditing, Content strategy.',
    ),
    Service(
      title: 'Business Development',
      description: 'Empower your business with strategic growth services.',
      price: '\$700',
      icon: Icons.business,
      details: 'Market entry, Sales optimization, Strategic consulting.',
    ),
    Service(
      title: 'Marketing Plan',
      description: 'Customized marketing plans that drive measurable results.',
      price: '\$600',
      icon: Icons.campaign,
      details: 'Digital strategy, Advertising, Competitor analysis.',
    ),
    Service(
      title: 'Graphics & Motion Graphics',
      description: 'Stunning graphics and motion designs to elevate your brand.',
      price: '\$300',
      icon: Icons.brush,
      details: 'Logos, banners, animation, brand collateral.',
    ),
    Service(
      title: 'Branding & Promotion',
      description: 'Full branding solutions to create a cohesive image for your brand.',
      price: '\$500',
      icon: Icons.branding_watermark,
      details: 'Brand strategy, Campaigns, Cross-platform promotions.',
    ),
    Service(
      title: 'Training & Recruitment',
      description: 'Build a skilled team with professional training and recruitment.',
      price: '\$400',
      icon: Icons.people,
      details: 'Employee skill development, Recruitment, Leadership training.',
    ),
    Service(
      title: 'Ads Problems & Online Security',
      description: 'Protect your business and resolve ad-related issues.',
      price: '\$350',
      icon: Icons.security,
      details: 'Ad performance optimization, Data protection, Security audits.',
    ),
    Service(
      title: 'Verification & Recovery',
      description: 'Get your verification badge or recover hacked accounts and data.',
      price: '\$250',
      icon: Icons.verified,
      details: 'Verification assistance, Account recovery, Data retrieval.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Services'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CarouselSlider.builder(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height * 0.75,
            enlargeCenterPage: true,
            autoPlay: true,
            enableInfiniteScroll: true,
            scrollDirection: Axis.vertical,
          ),
          itemCount: services.length,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            final service = services[index];
            return ServiceCard(service: service);
          },
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final Service service;

  const ServiceCard({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(service.icon, size: 48, color: Colors.teal),
            SizedBox(height: 16),
            Text(
              service.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              service.description,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 16),
            Text(
              'Starting at ${service.price}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.teal,
              ),
            ),
            SizedBox(height: 16),
            Text(
              service.details,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle request for quote action
              },
              child: Text('Request a Quote'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Service {
  final String title;
  final String description;
  final String price;
  final IconData icon;
  final String details;

  Service({
    required this.title,
    required this.description,
    required this.price,
    required this.icon,
    required this.details,
  });
}
