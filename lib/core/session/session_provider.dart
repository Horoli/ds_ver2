import 'package:ds_ver2/app/common/packages.dart';

class SessionState {
  final String? id;
  final String? accessToken;
  final String? refreshToken;
  const SessionState({
    this.id,
    this.accessToken,
    this.refreshToken,
  });

  SessionState copyWith({
    String? id,
    String? accessToken,
    String? refreshToken,
  }) =>
      SessionState(
        id: id ?? this.id,
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );
}

class SessionController extends StateNotifier<SessionState> {
  SessionController() : super(const SessionState());
  void setUser(String id, String? accessToken, String? refreshToken) {
    state = state.copyWith(
      id: id,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  void clear() => state = const SessionState();
}

final sessionProvider = StateNotifierProvider<SessionController, SessionState>(
    (ref) => SessionController());
