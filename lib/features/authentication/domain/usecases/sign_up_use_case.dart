import 'package:temari/core/typedef.dart';
import 'package:temari/core/usecase/usecase.dart';
import 'package:temari/features/authentication/domain/entities/user.dart';
import 'package:temari/features/authentication/domain/repositories/auth_repo.dart';

class SignUpUseCase extends Usecase<User, Param> {
  SignUpUseCase({required this.repo});
  final AuthRepo repo;

  @override
  ResultFuture<User> call(Param param) {
    return repo.signUp(email: param.email, password: param.password);
  }
}

class Param {
  const Param({required this.email, required this.password});
  final String email;
  final String password;
}
