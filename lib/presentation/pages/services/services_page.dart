import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/presentation/pages/services/quote_creation.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import '../../../app_colors.dart'; // Assuming you have the colors file

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  final List<Map<String, dynamic>> services = [
    {
      'name': 'Software Development',
      'description': 'We build custom software solutions tailored to your needs.',
      'minPayment': 500,
      'provider': 'ADMA',
      'details': 'Our software development team specializes in creating tailored solutions to meet your business needs, using the latest technologies to ensure scalability and performance.'
    },
    {
      'name': 'Search Engine Optimization',
      'description': 'Boost your website visibility and attract more visitors.',
      'minPayment': 200,
      'provider': 'ADMA',
      'details': 'Our SEO experts implement strategies to increase your site’s visibility and organic traffic, ensuring you reach your target audience effectively.'
    },
    {
      'name': 'Business Development',
      'description': 'Helping your business thrive and expand successfully.',
      'minPayment': 100,
      'provider': 'ADMA',
      'details': 'We offer strategic consulting and solutions to help you identify growth opportunities and effectively navigate challenges.'
    },
    {
      'name': 'Marketing Plans and Strategies',
      'description': 'Comprehensive marketing plans tailored for success.',
      'minPayment': 300,
      'provider': 'ADMA',
      'details': 'Our marketing team will work with you to create effective strategies that align with your business goals, ensuring your message reaches the right audience.'
    },
    {
      'name': 'Graphics and Design & Motion Graphics',
      'description': 'Creative visuals to elevate your brand.',
      'minPayment': 250,
      'provider': 'ADMA',
      'details': 'We provide stunning graphics and animations that capture attention and convey your brand message effectively.'
    },
    {
      'name': 'Branding and Promotion',
      'description': 'Building a memorable brand identity.',
      'minPayment': 400,
      'provider': 'ADMA',
      'details': 'Our branding services will help you establish a strong and recognizable brand, enhancing your visibility and reputation in the market.'
    },
    {
      'name': 'Social Media Management',
      'description': 'Engaging your audience through social media.',
      'minPayment': 150,
      'provider': 'ADMA',
      'details': 'We manage your social media presence, creating engaging content that resonates with your audience and drives interaction.'
    },
    {
      'name': 'Training and Recruitment',
      'description': 'Empowering your team for success.',
      'minPayment': 200,
      'provider': 'ADMA',
      'details': 'We offer training programs and recruitment services to help you build a skilled team capable of driving your business forward.'
    },
    {
      'name': 'Ads Problems and Online Security',
      'description': 'Ensuring your online ads run smoothly and securely.',
      'minPayment': 180,
      'provider': 'ADMA',
      'details': 'We address any issues with your online ads and provide security measures to protect your data and privacy.'
    },
    {
      'name': 'Verification Badge',
      'description': 'Authenticating your business online.',
      'minPayment': 250,
      'provider': 'ADMA',
      'details': 'Our verification services ensure that your business is recognized as legitimate, enhancing your credibility and trust with customers.'
    },
    {
      'name': 'Recovery of Hacked Data/Account',
      'description': 'Helping you recover compromised accounts and data.',
      'minPayment': 300,
      'provider': 'ADMA',
      'details': 'Our experts will assist you in recovering hacked accounts and securing your data to prevent future breaches.'
    },
  ];

  String _searchText = '';

  void _navigateToQuoteCreation(Map<String, dynamic> service) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuoteCreationPage(service),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(
        title: Text('Services', style: AppTextStyles.appBartext.copyWith(color: AppColors.primary)),
        backgroundColor: AppColors.whiteTheme,
        leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Iconsax.arrow_left, color: AppColors.primary)),
        centerTitle: true,
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
           // Search Bar
TextField(
  cursorColor: AppColors.primary,
  onChanged: (text) {
    setState(() {
      _searchText = text.toLowerCase();
    });
  },
  decoration: InputDecoration(
    labelText: 'Search Services',
    labelStyle: AppTextStyles.bodyText1,
    prefixIcon: Icon(Iconsax.search_normal),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: AppColors.primary,
        width: 2.0,
      ),
    ),
  ),
),

            SizedBox(height: 12),

            // Service Cards
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: services
                      .where((service) => service['name'].toLowerCase().contains(_searchText) || service['description'].toLowerCase().contains(_searchText))
                      .map((service) {
                    return Card(
                      elevation: 2,
                      color: AppColors.cards,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(
                                service['name'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                              subtitle: Text(
                                service['description'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: AppColors.text, fontSize: 14),
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.info_outline),
                                color: AppColors.primary,
                                tooltip: "See More",
                                onPressed: () {
                                  _showServiceDetails(service);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Min Payment and Provider Details
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Minimum Price: \$${service['minPayment']}',
                                        style: TextStyle(
                                          color: AppColors.text,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Provider: ${service['provider']}',
                                        style: TextStyle(
                                          color: AppColors.text,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),

                                  // Button for Creating Quote
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: ElevatedButton.icon(
                                      onPressed: () {
                                        _navigateToQuoteCreation(service);
                                      },
                                      label: Text(
                                        'Create Quote',
                                        style: AppTextStyles.buttonText,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: AppColors.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Modal to show more details about the service
  void _showServiceDetails(Map<String, dynamic> service) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                service['name'],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                service['details'], // Show detailed information here
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Provider: ${service['provider']}',
                    style: TextStyle(fontSize: 14, color: AppColors.text),
                  ),
                  Text(
                    'Minimum price: \$${service['minPayment']}',
                    style: TextStyle(fontSize: 14, color: AppColors.text),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Final price to be determined after analysis',
                style: TextStyle(fontSize: 14, color: AppColors.accent),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: Text('Close', style: AppTextStyles.buttonText,),
              ),
            ],
          ),
        );
      },
    );
  }
}