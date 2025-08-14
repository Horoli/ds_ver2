import 'package:ds_ver2/app/common/build_packages.dart';
import 'package:ds_ver2/features/auth/private_data.dart';
part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.idle() = AuthIdle;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authed(User user) = AuthAuthed;
  const factory AuthState.error(String message) = AuthError;
}
