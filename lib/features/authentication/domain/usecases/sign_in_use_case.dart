import 'package:temari/core/typedef.dart';
import 'package:temari/core/usecase/usecase.dart';
import 'package:temari/features/authentication/domain/entities/user.dart';
import 'package:temari/features/authentication/domain/repositories/auth_repo.dart';

class SignInUseCase extends Usecase<User, Param> {
  SignInUseCase({required this.repo});
  final AuthRepo repo;
  @override
  ResultFuture<User> call(Param param) {
    return repo.signIn(
      identifier: param.identifier,
      password: param.password,
    );
  }
}

class Param {
  const Param({
    required this.identifier,
    required this.password,
  });
  final String identifier;
  final String password;
}
