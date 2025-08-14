import 'package:ds_ver2/features/dashboard/presentation/screens/dashboard.dart';
import '../features/auth/presentation/screens/login.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../features/auth/providers.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final user = ref.read(currentUserProvider);
      final loggingIn = state.fullPath == '/login';
      if (user == null && !loggingIn) return '/login';
      if (user != null && loggingIn) return '/dashboard';

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/dashboard', builder: (_, __) => const DashboardScreen()),
    ],
  );
});
