import 'package:dio/dio.dart';
import 'package:ds_ver2/features/login/private_data.dart';
import 'package:ds_ver2/features/login/private_domain.dart';
import 'package:ds_ver2/features/login/private_presentation.dart';
import 'package:ds_ver2/core/core.dart'; // defaultDio, ApiClient, DioApiClient 등
// import 'package:ds_ver2/app/common/packages.dart';
import 'package:ds_ver2/app/common/build_packages.dart';

part 'providers.g.dart';

/// 외부 의존성
@riverpod
Dio dio(ref) => defaultDio;

@riverpod
ApiClient apiClient(ref) => DioApiClient(ref.watch(dioProvider));

/// Repository
@riverpod
AuthRepository authRepository(ref) =>
    AuthRepositoryImpl(ref.watch(apiClientProvider));

/// 읽기 전용 파생 Provider (다른 feature에서 import해 사용)
@riverpod
User? currentUser(ref) {
  final state = ref.watch(authControllerProvider);
  return switch (state) {
    AuthAuthed(:final user) => user,
    _ => null,
  };
}

// final dioProvider = Provider((ref) => defaultDio);
// final apiClientProvider =
//     Provider<ApiClient>((ref) => DioApiClient(ref.read(dioProvider)));

// // Repository
// final authRepositoryProvider = Provider<AuthRepository>(
//     (ref) => AuthRepositoryImpl(ref.read(apiClientProvider)));

// // Controller(StateNotifier)
// final authControllerProvider =
//     StateNotifierProvider<AuthController, AuthState>((ref) {
//   return AuthController(ref, ref.read(authRepositoryProvider));
// });

// final currentUserProvider = Provider<User?>((ref) {
//   final state = ref.watch(authControllerProvider);
//   return switch (state) { AuthAuthed(:final user) => user, _ => null };
// });
