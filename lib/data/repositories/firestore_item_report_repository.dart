import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/constants/firestore_paths.dart';
import '../../core/errors/app_exception.dart';
import '../models/item_report.dart';
import '../models/item_report_enums.dart';
import 'item_report_repository.dart';

class FirestoreItemReportRepository implements ItemReportRepository {
  FirestoreItemReportRepository({
    FirebaseFirestore? firestore,
  }) : _db = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _db;

  CollectionReference<Map<String, dynamic>> get _reports {
    return _db.collection(kReportsCollection);
  }

  @override
  Stream<List<ItemReport>> watchReports({
    ReportType? type,
    ItemCategory? category,
  }) async* {
    try {
      Query<Map<String, dynamic>> query = _reports;

      if (type != null) {
        query = query.where(
          'reportType',
          isEqualTo: type.name,
        );
      }

      if (category != null) {
        query = query.where(
          'category',
          isEqualTo: category.name,
        );
      }

      query = query.orderBy(
        'createdAt',
        descending: true,
      ).limit(50);

      await for (final snapshot in query.snapshots()) {
        final reports = snapshot.docs
            .map(ItemReport.fromFirestore)
            .toList();

        yield reports;
      }
    } on FirebaseException catch (error) {
      throw AppException(
        'Could not load reports. Please check your connection and try again.',
        code: error.code,
      );
    } catch (_) {
      throw const AppException(
        'Could not load reports. Please try again.',
      );
    }
  }

  @override
  Future<ItemReport?> getReport(String id) async {
    try {
      final doc = await _reports.doc(id).get();

      if (!doc.exists) {
        return null;
      }

      return ItemReport.fromFirestore(doc);
    } on FirebaseException catch (error) {
      throw AppException(
        'Could not load this report. Please try again.',
        code: error.code,
      );
    } catch (_) {
      throw const AppException(
        'Could not load this report. Please try again.',
      );
    }
  }

  @override
  Future<String> createReport(ItemReport report) async {
    try {
      final docRef = await _reports.add(
        report.toFirestore(isCreate: true),
      );

      return docRef.id;
    } on FirebaseException catch (error) {
      throw AppException(
        'Could not create report. Please try again.',
        code: error.code,
      );
    } catch (_) {
      throw const AppException(
        'Could not create report. Please try again.',
      );
    }
  }

  @override
  Future<void> updateReport(ItemReport report) async {
    try {
      if (report.id.trim().isEmpty) {
        throw const AppException(
          'Cannot update report without an ID.',
        );
      }

      final data = report.toFirestore();

      data.remove('createdAt');
      data['updatedAt'] = FieldValue.serverTimestamp();

      await _reports.doc(report.id).update(data);
    } on AppException {
      rethrow;
    } on FirebaseException catch (error) {
      throw AppException(
        'Could not update report. Please try again.',
        code: error.code,
      );
    } catch (_) {
      throw const AppException(
        'Could not update report. Please try again.',
      );
    }
  }

  @override
  Future<void> deleteReport(String id) async {
    try {
      if (id.trim().isEmpty) {
        throw const AppException(
          'Cannot delete report without an ID.',
        );
      }

      await _reports.doc(id).delete();
    } on AppException {
      rethrow;
    } on FirebaseException catch (error) {
      throw AppException(
        'Could not delete report. Please try again.',
        code: error.code,
      );
    } catch (_) {
      throw const AppException(
        'Could not delete report. Please try again.',
      );
    }
  }
}