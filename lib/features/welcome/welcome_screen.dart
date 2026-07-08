import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_spacing.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(kSpaceL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.manage_search_rounded,
                size: 88,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: kSpaceL),
              Text(
                'ReClaim',
                style: theme.textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: kSpaceS),
              Text(
                'Smart Campus Lost & Found',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: kSpaceXL),
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: () => context.go('/home'),
                  icon: const Icon(Icons.arrow_forward_rounded),
                  label: const Text('Continue'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}