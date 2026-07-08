import 'package:flutter/material.dart';

class ReportDetailsScreen extends StatelessWidget {
  const ReportDetailsScreen({super.key, required this.reportId});
  final String reportId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report Details')),

      body: Center(
        child: Text('data'),
      ),
    );
  }
}
