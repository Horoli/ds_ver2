import 'package:ds_ver2/app/common/packages.dart';
import 'package:ds_ver2/core/core.dart';
import 'package:ds_ver2/features/auth/data.dart';
import 'package:ds_ver2/features/auth/domain.dart';
import 'package:ds_ver2/features/auth/presentation.dart';

// 외부 의존성
final dioProvider = Provider((ref) => defaultDio);
final apiClientProvider =
    Provider<ApiClient>((ref) => DioApiClient(ref.read(dioProvider)));

// Repository
final authRepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRepositoryImpl(ref.read(apiClientProvider)));

// Controller(StateNotifier)
final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(ref, ref.read(authRepositoryProvider));
});

// 읽기 전용 파생 Provider (다른 feature가 import 해 사용)
final currentUserProvider = Provider<User?>((ref) {
  final state = ref.watch(authControllerProvider);
  return switch (state) { AuthAuthed(:final user) => user, _ => null };
});
