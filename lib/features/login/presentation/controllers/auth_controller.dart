import 'package:ds_ver2/features/login/private_domain.dart'; // 배럴 한 경로만
import 'package:ds_ver2/features/login/providers/providers.dart';
import 'package:ds_ver2/app/common/build_packages.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  AuthState build() => const AuthState.idle();

  Future<void> login({required String id, required String pw}) async {
    state = const AuthState.loading();
    try {
      final repo = ref.read(authRepositoryProvider);
      final user = await repo.login(id: id, password: pw);
      // 세션 업데이트가 필요하다면 여기서 ref.read(sessionProvider.notifier) 사용
      state = AuthState.authed(user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> logout() async {
    try {
      final repo = ref.read(authRepositoryProvider);
      await repo.logout();
    } finally {
      state = const AuthState.idle();
    }
  }
}
