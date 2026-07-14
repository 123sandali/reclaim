import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/firestore_item_report_repository.dart';
import '../repositories/item_report_repository.dart';

final reportRepositoryProvider = Provider<ItemReportRepository>((ref) {
  return FirestoreItemReportRepository();
});