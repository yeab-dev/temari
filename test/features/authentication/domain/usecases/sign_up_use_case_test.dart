import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temari/features/authentication/domain/entities/user.dart';
import 'package:temari/features/authentication/domain/repositories/auth_repo.dart';
import 'package:temari/features/authentication/domain/usecases/sign_up_use_case.dart';

import 'mock_auth_repo.dart';

void main() {
  late MockAuthRepo repo;
  late SignUpUseCase useCase;
  final tUser = User(id: '1', email: 'user@email.com');
  Params params = Params(email: 'user@email.com', password: '123');
  setUp(() {
    repo = MockAuthRepo();
    useCase = SignUpUseCase(repo: repo);
  });

  test('should call [repo.signUp] and return with the right data', () async {
    when(() => repo.signUp(
            email: any(named: 'email'), password: any(named: 'password')))
        .thenAnswer((_) async => Right(tUser));
    final result = await useCase(params);
    expect(result, Right(tUser));
    verify(() => repo.signUp(
        email: any(named: 'email'),
        password: any(named: 'password'))).called(1);
    verifyNoMoreInteractions(repo);
  });
}
