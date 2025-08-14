import 'package:ds_ver2/features/auth/private_data.dart';

abstract class AuthRepository {
  Future<User> login({required String id, required String password});
  Future<void> logout();
}
