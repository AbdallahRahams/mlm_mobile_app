import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PDFUtil {
  Future<String> saveQuoteAsPDF(
    String fileName, // Filename for the saved PDF
    pw.Document pdf, // The generated PDF document
  ) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/$fileName.pdf';
    final file = File(path);

    await file.writeAsBytes(await pdf.save());
    return path;
  }

  // Main method to build invoice layout
  pw.Widget buildInvoiceLayout(
    String clientName,
    String clientCompany,
    String clientAddress,
    String clientEmail,
    String clientPhone,
    List<Map<String, dynamic>> services,
    double subtotal,
    double taxPercentage,
    double discount,
  ) {
    // Calculate total values
    double taxAmount = subtotal * (taxPercentage / 100);
    double total = subtotal + taxAmount - discount;

    return pw.Column(
      children: [
        _buildHeaderSection('African Digital Marketing Agency', 'Millenium Tower, Dar Es Salaam', '+255 741 422 722', 'info@adma.com', 'www.adma.com'),
        pw.SizedBox(height: 20),
        _buildClientInfo(clientName, clientCompany, clientAddress, clientPhone, clientEmail),
        pw.SizedBox(height: 20),
        _buildInvoiceDetails(),
        pw.SizedBox(height: 20),
        _buildTable(services),
        pw.SizedBox(height: 20),
        _buildTotalSection(subtotal, taxAmount, discount, total),
        pw.SizedBox(height: 20),
        _buildFooter('Thank you for your business!', '+255 741 422 722', 'support@adma.com', 'www.adma.com'),
      ],
    );
  }

  // Main method to build quote layout
  pw.Widget buildQuoteLayout(
    String clientName,
    String clientCompany,
    String clientAddress,
    String clientEmail,
    String clientPhone,
    String serviceDescription,
    double price,
    String validity,
    String paymentTerms,
    String deliveryTimeline,
    String serviceType,
    String serviceSpecialization,
  ) {
    return pw.Container(
      padding: pw.EdgeInsets.all(20),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey400),
        borderRadius: pw.BorderRadius.circular(8),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _buildHeaderSection('African Digital Marketing Agency', 'Millenium Tower, Dar Es Salaam', '+255 741 422 722', 'info@adma.com', 'www.adma.com'),
          pw.SizedBox(height: 20),
          _buildClientInfo(clientName, clientCompany, clientAddress, clientPhone, clientEmail),
          pw.SizedBox(height: 20),
          pw.Text('Service Description', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
          pw.Text(serviceDescription, style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700)),
          pw.SizedBox(height: 10),
          _buildInfoRow('Service Type', serviceType),
          _buildInfoRow('Specialization', serviceSpecialization),
          pw.SizedBox(height: 10),
          _buildTotalSection(price, 0, 0, price),  // Only the price is shown for quotes
          pw.SizedBox(height: 10),
          _buildAdditionalInfo(validity, paymentTerms, deliveryTimeline), // Centered delivery timeline
          pw.SizedBox(height: 20),
          _buildFooter('We look forward to working with you!', '+255 741 422 722', 'support@adma.com', 'www.adma.com'), // Centered footer
        ],
      ),
    );
  }

  // Helper method to build header section
  pw.Widget _buildHeaderSection(
    String companyName,
    String companyAddress,
    String companyPhone,
    String companyEmail,
    String companyWebsite,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(companyName, style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
        pw.Text(companyAddress, style: pw.TextStyle(fontSize: 12)),
        _buildInfoRow('Phone', companyPhone),
        _buildInfoRow('Email', companyEmail),
        _buildInfoRow('Website', companyWebsite),
        pw.SizedBox(height: 20),
        pw.Divider(height: 1, thickness: 1),
      ],
    );
  }

  // Helper method to build client info section
  pw.Widget _buildClientInfo(
    String clientName,
    String clientCompany,
    String clientAddress,
    String clientPhone,
    String clientEmail,
  ) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Bill To:', style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 5),
        pw.Text(clientName, style: pw.TextStyle(fontSize: 12)),
        pw.Text(clientCompany, style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700)),
        pw.Text(clientAddress, style: pw.TextStyle(fontSize: 12)),
        _buildInfoRow('Phone', clientPhone),
        _buildInfoRow('Email', clientEmail),
      ],
    );
  }

  // Helper method to build invoice details section
  pw.Widget _buildInvoiceDetails() {
    return pw.Container(
      padding: pw.EdgeInsets.all(8),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        borderRadius: pw.BorderRadius.circular(5),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          _buildInfoRow('Invoice #', '12345'),
          _buildInfoRow('Date', '01/01/2024'),
          _buildInfoRow('Due Date', '15/01/2024'),
        ],
      ),
    );
  }

  // Helper method to build services table
  pw.Widget _buildTable(List<Map<String, dynamic>> services) {
    final headers = ['Description', 'Quantity', 'Unit Price', 'Total'];

    return pw.TableHelper.fromTextArray(
      headers: headers,
      data: services.map((service) {
        return [
          service['description'],
          service['quantity'].toString(),
          service['unitPrice'].toString(),
          service['total'].toString(),
        ];
      }).toList(),
      headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
      headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: pw.Alignment.centerLeft,
        1: pw.Alignment.center,
        2: pw.Alignment.center,
        3: pw.Alignment.centerRight,
      },
    );
  }

  // Helper method to build total section
  pw.Widget _buildTotalSection(double subtotal, double tax, double discount, double total) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        _buildTotalRow('Subtotal', subtotal.toStringAsFixed(2)),
        _buildTotalRow('Tax', tax.toStringAsFixed(2)),
        _buildTotalRow('Discount', discount.toStringAsFixed(2)),
        _buildTotalRow('Total', total.toStringAsFixed(2)),
      ],
    );
  }

  // Helper method to build individual total row
  pw.Widget _buildTotalRow(String label, String value) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(label, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.Text(value, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
      ],
    );
  }

  // Helper method to build additional info section
  pw.Widget _buildAdditionalInfo(String validity, String paymentTerms, String deliveryTimeline) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.center, // Centered horizontally
      children: [
        _buildInfoRow('Validity', validity),
        _buildInfoColumn('Payment Terms', paymentTerms),
        pw.SizedBox(height: 20),
        _buildInfoColumn('Delivery Timeline', deliveryTimeline), // Delivery Timeline centered
      ],
    );
  }

  // Helper method to build info rows
  pw.Widget _buildInfoRow(String label, String value) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(label, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.Text(value, style: pw.TextStyle(fontSize: 12)),
      ],
    );
  }

  // Helper method to build info columns
  pw.Widget _buildInfoColumn(String label, String value) {
    return pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.center, // Centered
      children: [
        pw.Text(label, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        pw.Text(value, style: pw.TextStyle(fontSize: 12)),
      ],
    );
  }

  // Helper method to build info
  pw.Widget _buildInfo(String value) {
    return pw.Text(value, style: pw.TextStyle(fontSize: 12, color: PdfColors.grey700));
  }

  // Helper method to build footer section
pw.Widget _buildFooter(String message, String phone, String email, String website) {
  return pw.Container(
    alignment: pw.Alignment.center,  // Centers the content both vertically and horizontally
    child: pw.Column(
      mainAxisAlignment: pw.MainAxisAlignment.center,
      crossAxisAlignment: pw.CrossAxisAlignment.center,
      children: [
        pw.Text(message, style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
        _buildInfo(phone),
        _buildInfo(email),
        _buildInfo(website),
      ],
    ),
  );
}

}