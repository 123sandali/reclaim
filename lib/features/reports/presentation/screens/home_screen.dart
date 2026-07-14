// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import '../../../../app/theme/app_spacing.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ReClaim'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(kSpaceL),
//         child: Center(
//           child: Text(
//             'Real-time lost and found reports will appear here.',
//             textAlign: TextAlign.center,
//             style: theme.textTheme.titleMedium,
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () => context.go('/reports/new'),
//         icon: const Icon(Icons.add_rounded),
//         label: const Text('Report'),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/models/item_report.dart';
import '../../../../data/models/item_report_enums.dart';
import '../../../../data/providers/report_repository_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  Future<void> _createTestReport(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final repository = ref.read(reportRepositoryProvider);
    final now = DateTime.now();

    final report = ItemReport(
      id: '',
      title: 'Test Lost Phone',
      description: 'This is a temporary test report created from Task 7.',
      reportType: ReportType.lost,
      category: ItemCategory.electronics,
      color: 'Black',
      locationText: 'Library',
      incidentDate: now,
      status: ReportStatus.open,
      createdAt: now,
      updatedAt: now,
      contactInfo: 'test@example.com',
      ownerId: null,
      imageUrls: const [],
    );

    try {
      final id = await repository.createReport(report);

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Test report created: $id'),
        ),
      );
    } catch (error) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReClaim'),
      ),
      body: Center(
        child: FilledButton.icon(
          onPressed: () => _createTestReport(context, ref),
          icon: const Icon(Icons.cloud_upload_rounded),
          label: const Text('Create Test Report'),
        ),
      ),
    );
  }
}