import '../../../core/network/api_client.dart';
import '../domain/entities/user.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ApiClient api;
  AuthRepositoryImpl(this.api);

  @override
  Future<User> login({required String id, required String password}) async {
    final res = await api.post('/members/accounts/sign-in', data: {
      'email': id,
      'password': password,
    });

    Map<String, dynamic> data = res.data as Map<String, dynamic>;
    data['id'] = id;
    return User.fromMap(res.data as Map<String, dynamic>);
  }

  @override
  Future<void> logout() async {}
}
