import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/theme/app_spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ReClaim'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kSpaceL),
        child: Center(
          child: Text(
            'Real-time lost and found reports will appear here.',
            textAlign: TextAlign.center,
            style: theme.textTheme.titleMedium,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/reports/new'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Report'),
      ),
    );
  }
}