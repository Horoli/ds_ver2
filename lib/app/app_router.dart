import 'package:ds_ver2/features/dashboard/public.dart';
import 'package:ds_ver2/features/auth/public.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
