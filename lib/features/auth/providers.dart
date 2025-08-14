import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/api_client.dart';
import 'data/auth_repository.dart';
import 'data/auth_repository_impl.dart';
import 'domain/auth_state.dart';
import 'domain/entities/user.dart';
import 'presentation/controllers/auth_controller.dart';

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
