import 'package:temari/core/typedef.dart';
import 'package:temari/core/usecase/usecase.dart';
import 'package:temari/features/authentication/domain/entities/user.dart';
import 'package:temari/features/authentication/domain/repositories/auth_repo.dart';

class SignUpUseCase extends Usecase<User, Params> {
  SignUpUseCase({required this.repo});
  final AuthRepo repo;

  @override
  ResultFuture<User> call(Params param) {
    return repo.signUp(email: param.email, password: param.password);
  }
}

class Params {
  const Params({required this.email, required this.password});
  final String email;
  final String password;
}
