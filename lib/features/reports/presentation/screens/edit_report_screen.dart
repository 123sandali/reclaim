import 'package:flutter/material.dart';

class EditReportScreen extends StatelessWidget {
  const EditReportScreen({
    super.key,
    required this.reportId,
  });

  final String reportId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Report'),
      ),
      body: Center(
        child: Text('Edit report ID: $reportId'),
      ),
    );
  }
}