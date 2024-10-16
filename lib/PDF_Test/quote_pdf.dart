import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PDFUtil {
  Future<String> createQuotePdf({
    required String clientName,
    required String serviceDescription,
    required String price,
    required String validity,
    required String paymentTerms,
    required String deliveryTimeline,
    required String logoPath, // Add logo to the quote
    required List<Map<String, String>>
        items, // Allow multiple items in the quote
  }) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Container(
            margin: const pw.EdgeInsets.all(32),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _buildHeader(logoPath, clientName),
                pw.SizedBox(height: 16),
                _buildClientInfo(clientName),
                pw.SizedBox(height: 20),
                _buildItemsTable(items),
                pw.SizedBox(height: 16),
                _buildSummary(price),
                pw.SizedBox(height: 32),
                _buildFooter(paymentTerms, validity, deliveryTimeline),
              ],
            ),
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final filePath = '${output.path}/quote_$clientName.pdf';
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    return filePath;
  }

  pw.Widget _buildHeader(String logoPath, String clientName) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Image(pw.MemoryImage(File(logoPath).readAsBytesSync()), width: 100),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.end,
          children: [
            pw.Text('QUOTE',
                style:
                    pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
            pw.Text('Date: ${DateTime.now().toString().split(' ')[0]}'),
            pw.Text(
                'Expiry: ${DateTime.now().add(Duration(days: 7)).toString().split(' ')[0]}'),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildClientInfo(String clientName) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Client: $clientName',
            style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 8),
        pw.Text('Address: 123 Client Street, City, State'),
        pw.Text('Phone: +254 123 456 789'),
        pw.Text('Email: client@example.com'),
      ],
    );
  }

  pw.Widget _buildItemsTable(List<Map<String, String>> items) {
    final headers = ['S.No', 'Description', 'Qty', 'Unit Price', 'Total'];
    final data = items.asMap().entries.map((entry) {
      final item = entry.value;
      return [
        '${entry.key + 1}',
        item['description'] ?? '',
        item['qty'] ?? '',
        item['unitPrice'] ?? '',
        item['total'] ?? '',
      ];
    }).toList();

    return pw.Table.fromTextArray(
      headers: headers,
      data: data,
      headerStyle:
          pw.TextStyle(fontWeight: pw.FontWeight.bold, color: PdfColors.white),
      headerDecoration: pw.BoxDecoration(color: PdfColors.blue),
      border: pw.TableBorder.all(),
      cellAlignment: pw.Alignment.centerLeft,
      headerHeight: 25,
      cellHeight: 40,
    );
  }

  pw.Widget _buildSummary(String price) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.end,
      children: [
        pw.Text('Total: $price',
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
      ],
    );
  }

  pw.Widget _buildFooter(
      String paymentTerms, String validity, String deliveryTimeline) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Payment Terms: $paymentTerms'),
        pw.Text('Validity: $validity days'),
        pw.Text('Delivery Timeline: $deliveryTimeline'),
        pw.SizedBox(height: 16),
        pw.Divider(),
        pw.Text(
          'Thank you for your business!',
          style: pw.TextStyle(fontSize: 12, fontStyle: pw.FontStyle.italic),
        ),
      ],
    );
  }
}

void main() async {
  final pdfUtil = PDFUtil();

  // Sample data
  final items = [
    {
      'description': 'Web Development',
      'qty': '1',
      'unitPrice': '1500.00',
      'total': '1500.00'
    },
    {
      'description': 'Mobile App Development',
      'qty': '2',
      'unitPrice': '1200.00',
      'total': '2400.00'
    },
  ];

  final pdfPath = await pdfUtil.createQuotePdf(
    clientName: 'Bryan Salvation',
    serviceDescription: 'Web Development and App Development',
    price: '3900.00',
    validity: '30',
    paymentTerms: 'Net 30 days',
    deliveryTimeline: '2 Weeks',
    logoPath: '/path/to/logo.png',
    items: items,
  );

  print('PDF saved at: $pdfPath');
}
