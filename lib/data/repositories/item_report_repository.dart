import '../models/item_report.dart';
import '../models/item_report_enums.dart';

abstract class ItemReportRepository {
  Stream<List<ItemReport>> watchReports({
    ReportType? type,
    ItemCategory? category,
  });

  Future<ItemReport?> getReport(String id);

  Future<String> createReport(ItemReport report);

  Future<void> updateReport(ItemReport report);

  Future<void> deleteReport(String id);
}