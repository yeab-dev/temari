import 'package:temari/core/typedef.dart';
import 'package:temari/features/authentication/domain/entities/user.dart';

abstract class AuthRepo {
  ResultFuture<User> signUp({
    required String email,
    required String password,
  });

  ResultFuture<User> signIn({
    required String identifier,
    required String password,
  });

  ResultVoid signOut();
}
