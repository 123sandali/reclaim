import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reclaim/data/models/item_report.dart';
import 'package:reclaim/data/models/item_report_enums.dart';

void main() {
  group('ItemReport', () {
    test('fromMap creates ItemReport correctly', () {
      final now = DateTime(2026, 7, 8);

      final report = ItemReport.fromMap(
        id: 'report-1',
        data: {
          'title': 'Black Dell Laptop',
          'description': 'Lost near the library block B.',
          'reportType': 'lost',
          'category': 'electronics',
          'color': 'Black',
          'locationText': 'Library Block B',
          'incidentDate': Timestamp.fromDate(now),
          'contactInfo': 'menura@example.com',
          'status': 'open',
          'createdAt': Timestamp.fromDate(now),
          'updatedAt': Timestamp.fromDate(now),
          'ownerId': null,
          'imageUrls': <String>[],
        },
      );

      expect(report.id, 'report-1');
      expect(report.title, 'Black Dell Laptop');
      expect(report.reportType, ReportType.lost);
      expect(report.category, ItemCategory.electronics);
      expect(report.status, ReportStatus.open);
      expect(report.locationText, 'Library Block B');
    });

    test('copyWith updates selected fields only', () {
      final now = DateTime(2026, 7, 8);

      final report = ItemReport(
        id: 'report-1',
        title: 'Old Title',
        description: 'Old description',
        reportType: ReportType.lost,
        category: ItemCategory.electronics,
        color: 'Black',
        locationText: 'Library',
        incidentDate: now,
        status: ReportStatus.open,
        createdAt: now,
        updatedAt: now,
      );

      final updatedReport = report.copyWith(
        title: 'New Title',
        status: ReportStatus.resolved,
      );

      expect(updatedReport.title, 'New Title');
      expect(updatedReport.status, ReportStatus.resolved);
      expect(updatedReport.description, 'Old description');
      expect(updatedReport.reportType, ReportType.lost);
    });

    test('toFirestore stores enum names as strings', () {
      final now = DateTime(2026, 7, 8);

      final report = ItemReport(
        id: 'report-1',
        title: 'Black Dell Laptop',
        description: 'Lost near the library block B.',
        reportType: ReportType.lost,
        category: ItemCategory.electronics,
        color: 'Black',
        locationText: 'Library Block B',
        incidentDate: now,
        status: ReportStatus.open,
        createdAt: now,
        updatedAt: now,
      );

      final map = report.toFirestore();

      expect(map['reportType'], 'lost');
      expect(map['category'], 'electronics');
      expect(map['status'], 'open');
    });
  });
}