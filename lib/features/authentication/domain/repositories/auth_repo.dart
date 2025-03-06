import 'package:temari/features/authentication/domain/entities/user.dart';

abstract class AuthRepo {
  Future<User> signUp({
    required String identifier,
    required String password,
  });

  Future<User> signIn({
    required String identifier,
    required String password,
  });

  Future<void> signOut();
}
