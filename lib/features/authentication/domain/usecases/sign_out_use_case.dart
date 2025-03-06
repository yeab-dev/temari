import 'package:temari/core/typedef.dart';
import 'package:temari/core/usecase/usecase.dart';
import 'package:temari/features/authentication/domain/repositories/auth_repo.dart';

class SignOutUseCase extends Usecase<void, NoParams> {
  SignOutUseCase({required this.repo});
  final AuthRepo repo;
  @override
  ResultFuture<void> call(NoParams param) {
    return repo.signOut();
  }
}

class NoParams {}
