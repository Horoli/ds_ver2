import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/data/models/user.dart';

class SessionState {
  final User? currentUser;
  final String? accessToken;
  final String? refreshToken;
  const SessionState({
    this.currentUser,
    this.accessToken,
    this.refreshToken,
  });

  SessionState copyWith({
    User? currentUser,
    String? accessToken,
    String? refreshToken,
  }) =>
      SessionState(
        currentUser: currentUser ?? this.currentUser,
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );
}

class SessionController extends StateNotifier<SessionState> {
  SessionController() : super(const SessionState());
  void setUser(User user, String? accessToken, String? refreshToken) {
    state = state.copyWith(
      currentUser: user,
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
  }

  void clear() => state = const SessionState();
}

final sessionProvider = StateNotifierProvider<SessionController, SessionState>(
    (ref) => SessionController());
