import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temari/core/errors/failure.dart';
import 'package:temari/features/authentication/domain/entities/user.dart';
import 'package:temari/features/authentication/domain/usecases/sign_in_use_case.dart';

import 'mock_auth_repo.dart';

void main() {
  late MockAuthRepo repo;
  late SignInUseCase useCase;
  final tUser = User(id: '1', email: 'user@emailcom');
  final tFailure = Failure(message: 'Error Occured', statusCode: 123);
  Params params = Params(identifier: 'user@email.com', password: '123');
  setUp(() {
    repo = MockAuthRepo();
    useCase = SignInUseCase(repo: repo);
  });
  group('signInUseCase', () {
    test(
        'should call [repo.SignIn] and return with the right data when successful',
        () async {
      when(() => repo.signIn(
              identifier: any(named: 'identifier'),
              password: any(named: 'password')))
          .thenAnswer((_) async => Right(tUser));
      final result = await useCase(params);
      expect(result, Right(tUser));
      verify(() => repo.signIn(
          identifier: any(named: 'identifier'),
          password: any(named: 'password'))).called(1);
      verifyNoMoreInteractions(repo);
    });
    test('should call [repo.signIn] and return with error when unseccessful',
        () async {
      when(() => repo.signIn(
              identifier: any(named: 'identifier'),
              password: any(named: 'password')))
          .thenAnswer((_) async => Left(tFailure));
      final result = await useCase(params);
      expect(result, Left(tFailure));
      verify(
        () => repo.signIn(
            identifier: any(named: 'identifier'),
            password: any(named: 'password')),
      ).called(1);
      verifyNoMoreInteractions(repo);
    });
  });
}
