import 'package:freezed_annotation/freezed_annotation.dart';
import 'entities/user.dart';
part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.idle() = AuthIdle;
  const factory AuthState.loading() = AuthLoading;
  const factory AuthState.authed(User user) = AuthAuthed;
  const factory AuthState.error(String message) = AuthError;
}
