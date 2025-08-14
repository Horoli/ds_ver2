import 'package:ds_ver2/core/session/session_provider.dart';
import 'package:ds_ver2/features/auth/data.dart' show AuthRepository;
import 'package:ds_ver2/features/auth/domain.dart' show AuthState;
import 'package:ds_ver2/app/common/packages.dart';

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository repo;
  final Ref ref;
  AuthController(this.ref, this.repo) : super(const AuthState.idle());

  Future<void> login({required String id, required String pw}) async {
    state = const AuthState.loading();
    try {
      final user = await repo.login(id: id, password: pw);
      // 세션 업데이트 (선택)
      ref
          .read(sessionProvider.notifier)
          .setUser(user, user.accessToken, user.refreshToken);
      state = AuthState.authed(user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await repo.logout();
    } finally {
      ref.read(sessionProvider.notifier).clear();
      state = const AuthState.idle();
    }
  }
}
