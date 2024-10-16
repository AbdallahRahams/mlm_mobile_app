import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mlm_mobile_app/app_colors.dart';
import 'package:mlm_mobile_app/presentation/pages/services/pdf_creator.dart';
import 'package:mlm_mobile_app/text_styles.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';

class QuoteCreationPage extends StatefulWidget {
  final Map<String, dynamic> service;

  QuoteCreationPage(this.service);

  @override
  _QuoteCreationPageState createState() => _QuoteCreationPageState();
}

class _QuoteCreationPageState extends State<QuoteCreationPage> {
  final _formKey = GlobalKey<FormState>();
  final FlutterLocalNotificationsPlugin _notificationsPlugin = FlutterLocalNotificationsPlugin();

  // Buyer information (editable)
  String clientName = '';
  String clientCompany = '';
  String clientEmail = '';
  String clientPhone = '';

  // Dynamic fields for service-specific options
  String selectedOption1 = 'None'; // For dropdown 1
  String selectedOption2 = 'None'; // For dropdown 2
  
  String serviceName = '';
  String minPayment = '\$100'; // Example

  // Flexible dropdown options
  List<String> dropdownOptions1 = ['None']; // Initially set to 'None'
  List<String> dropdownOptions2 = ['None'];

  @override
  void initState() {
    super.initState();
    serviceName = widget.service['name'] ?? 'Service Name';
    _initializeNotifications();
    _initializeDynamicFields();
  }

  void _initializeDynamicFields() {
    // Add flexible options based on the service name
    if (serviceName == 'Software Development') {
      dropdownOptions1 = ['None', 'Mobile App', 'Web App', 'Desktop App'];
      dropdownOptions2 = ['None', 'Frontend', 'Backend', 'Full Stack'];
    } else if (serviceName == 'Search Engine Optimization') {
      dropdownOptions1 = ['None', 'On-Page SEO', 'Off-Page SEO', 'Technical SEO'];
      dropdownOptions2 = ['None', 'Keyword Research', 'Backlinking', 'Site Audit'];
    } else if (serviceName == 'Business Development') {
      dropdownOptions1 = ['None', 'Strategic Consulting', 'Market Research', 'Sales Growth'];
      dropdownOptions2 = ['None', 'New Market Entry', 'Competitive Analysis', 'Growth Strategy'];
    } else if (serviceName == 'Graphics and Design & Motion Graphics') {
      dropdownOptions1 = ['None', 'Logo Design', 'Brochure Design', 'Motion Graphics'];
      dropdownOptions2 = ['None', 'Print', 'Digital', 'Animation'];
    } else {
      // Default catch-all for general services
      dropdownOptions1 = ['None', 'Consultation', 'Project Management', 'Training'];
      dropdownOptions2 = ['None', 'Strategy Development', 'Implementation', 'Optimization'];
    }
  }

  void _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) async {
        if (notificationResponse.payload != null) {
          print('Notification Payload: ${notificationResponse.payload}');
          await OpenFile.open(notificationResponse.payload);
        }
      },
    );
  }

  Future<void> _generateQuote() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Build PDF with dynamic data based on selected options
      final pdf = pw.Document();
      final pdfUtil = PDFUtil();
      final quoteLayout = pdfUtil.buildQuoteLayout(
        clientName,
        clientCompany,
        '123 Client Address', // Example
        clientEmail,
        clientPhone,
        'Service: $serviceName\nType: $selectedOption1\nSpecialization: $selectedOption2', // Dynamic data
        1000,
        '10 Days',
        'Upfront Deposit: 30% upon agreement signing \n Milestone Payments: 40% upon completion of initial design and prototyping phase \n Final Payment: 30% upon project completion and delivery',
        'Minimum: 1 Day, Maximum: To be planned depending on project needs',
        selectedOption1,
        selectedOption2
      );
      pdf.addPage(pw.Page(build: (pw.Context context) => quoteLayout));

      final bool saveConfirmed = await _askUserConfirmation();

      if (saveConfirmed) {
        final pdfPath = await pdfUtil.saveQuoteAsPDF('Quote_${clientName}_${DateTime.now().millisecondsSinceEpoch}', pdf);
        await _showNotification(pdfPath);
        _showFileLocationDialog(pdfPath);
      }
    }
  }

  Future<bool> _askUserConfirmation() async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Save'),
          content: Text('Do you want to save this quote to your device?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel', style: AppTextStyles.bodyText1.copyWith(color: AppColors.error)),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: Text('Save', style: AppTextStyles.bodyText1,),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    ) ?? false;
  }

  Future<void> _showNotification(String pdfPath) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'quote_channel',
      'Quote Notifications',
      channelDescription: 'Channel for Quote Notifications',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    await _notificationsPlugin.show(
      0,
      'Quote Generated',
      'Your quote has been created successfully. Tap to view.',
      platformChannelSpecifics,
      payload: pdfPath,
    );
  }

  void _showFileLocationDialog(String pdfPath) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('File Saved'),
        content: Text('Your quote has been saved at: $pdfPath'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      appBar: AppBar(
        title: Text('$serviceName', style: AppTextStyles.appBartext.copyWith(color: AppColors.primary)),
        backgroundColor: AppColors.whiteTheme,
        leading: IconButton(onPressed: () {
            Navigator.pop(context);
          }, icon: Icon(Iconsax.arrow_left, color: AppColors.primary)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Client Name', labelStyle: AppTextStyles.bodyText1, focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary, // Set your primary color here
        width: 2.0, // Optional: adjust the thickness of the underline
      ),
    ),),
                  validator: (value) => value!.isEmpty ? 'Enter client name' : null,
                  onSaved: (value) => clientName = value!,
                  cursorColor: AppColors.primary,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Company Name', labelStyle: AppTextStyles.bodyText1, focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary, // Set your primary color here
        width: 2.0, // Optional: adjust the thickness of the underline
      ),
    ),),
                  validator: (value) => value!.isEmpty ? 'Enter company name' : null,
                  onSaved: (value) => clientCompany = value!,
                  cursorColor: AppColors.primary,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email', labelStyle: AppTextStyles.bodyText1, focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary, // Set your primary color here
        width: 2.0, // Optional: adjust the thickness of the underline
      ),
    ),),
                  validator: (value) => value!.isEmpty ? 'Enter email' : null,
                  onSaved: (value) => clientEmail = value!,
                  cursorColor: AppColors.primary,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Phone Number', labelStyle: AppTextStyles.bodyText1, focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary, // Set your primary color here
        width: 2.0, // Optional: adjust the thickness of the underline
      ),
    ),),
                  validator: (value) => value!.isEmpty ? 'Enter phone number' : null,
                  onSaved: (value) => clientPhone = value!,
                  cursorColor: AppColors.primary,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Service', labelStyle: AppTextStyles.bodyText1, focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary, // Set your primary color here
        width: 2.0, // Optional: adjust the thickness of the underline
      ),
    ),),
                  initialValue: serviceName,
                  enabled: false,
                  cursorColor: AppColors.primary,
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Service Type', labelStyle: AppTextStyles.bodyText1, focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary, // Set your primary color here
        width: 2.0, // Optional: adjust the thickness of the underline
      ),
    ),),
                  items: dropdownOptions1
                      .map((option) => DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedOption1 = value.toString();
                    });
                  },
                  validator: (value) => value == null ? 'Please select an option' : null,
                  value: selectedOption1,
                ),
                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: 'Specialization', labelStyle: AppTextStyles.bodyText1, focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.primary, // Set your primary color here
        width: 2.0, // Optional: adjust the thickness of the underline
      ),
    ),),
                  items: dropdownOptions2
                      .map((option) => DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedOption2 = value.toString();
                    });
                  },
                  validator: (value) => value == null ? 'Please select an option' : null,
                  value: selectedOption2,
                ),
                SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.secondary,
                  ),
                  onPressed: _generateQuote,
                  icon: Icon(Iconsax.document),
                  label: Text('Generate Quote', style: AppTextStyles.button),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}