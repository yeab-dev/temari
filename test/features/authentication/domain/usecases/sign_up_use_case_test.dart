import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temari/features/authentication/domain/entities/user.dart';
import 'package:temari/features/authentication/domain/repositories/auth_repo.dart';
import 'package:temari/features/authentication/domain/usecases/sign_up_use_case.dart';

import 'mock_auth_repo.dart';

void main() {
  late AuthRepo repo;
  late SignUpUseCase usecase;
  final params = Params(email: 'email@test.com', password: '123');

  setUp(() {
    repo = MockAuthRepo();
    usecase = SignUpUseCase(repo: repo);
  });

  test('should call [AuthRepo.signUp] and return with the right data',
      () async {
    final tUser = User(id: '123', email: 'test@example.com');
    when(
      () => repo.signUp(
        email: any(named: 'email'),
        password: any(named: 'password'),
      ),
    ).thenAnswer((_) async => Right(tUser));

    final result = await usecase(params);
    expect(result, equals(Right(tUser)));
    verify(() => repo.signUp(
        email: any(named: 'email'),
        password: any(named: 'password'))).called(1);
    verifyNoMoreInteractions(repo);
  });
}
