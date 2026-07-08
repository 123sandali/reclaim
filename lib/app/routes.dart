import 'package:go_router/go_router.dart';

import '../features/welcome/welcome_screen.dart';
import '../features/reports/presentation/screens/home_screen.dart';
import '../features/reports/presentation/screens/add_report_screen.dart';
import '../features/reports/presentation/screens/report_details_screen.dart';
import '../features/reports/presentation/screens/edit_report_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'welcome',
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      path: '/home',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/reports/new',
      name: 'add-report',
      builder: (context, state) => const AddReportScreen(),
    ),
    GoRoute(
      path: '/reports/:id',
      name: 'report-details',
      builder: (context, state) {
        final reportId = state.pathParameters['id']!;
        return ReportDetailsScreen(reportId: reportId);
      },
    ),
    GoRoute(
      path: '/reports/:id/edit',
      name: 'edit-report',
      builder: (context, state) {
        final reportId = state.pathParameters['id']!;
        return EditReportScreen(reportId: reportId);
      },
    ),
  ],
);