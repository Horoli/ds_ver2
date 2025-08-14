import '../domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login({required String id, required String password});
  Future<void> logout();
}
