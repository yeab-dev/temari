import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:temari/features/authentication/domain/usecases/sign_out_use_case.dart';

import 'mock_auth_repo.dart';

void main() {
  late MockAuthRepo repo;
  late SignOutUseCase useCase;
  setUp(() {
    repo = MockAuthRepo();
    useCase = SignOutUseCase(repo: repo);
  });

  test('should call [repo.signOut] and return with the right data', () async {
    when(() => repo.signOut()).thenAnswer((_) async => const Right(null));
    final result = await useCase(NoParams());
    expect(result, const Right(null));
    verify(() => repo.signOut()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
