import 'package:dartz/dartz.dart';
import 'package:edu_app/core/errors/failiure.dart';
import 'package:edu_app/src/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:edu_app/src/on_boarding/domain/usecase/cache_first_timer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'onboarding_repo_mock.dart';

void main() {
  // Depedency
  late OnBoardingRepo repo;

  // Usecase
  late CacheFirstTimer usecase;

  setUp(() {
    repo = MockOnBoardingRepo();
    usecase = CacheFirstTimer(repo);
  });

  test('should call the [OnboardingRepo.cacheFirsTimer]', () async {
    when(() => repo.cacheFirstTimer()).thenAnswer(
      (_) async => const Left(
        ServerFailure(message: 'Unknown Error Occured', statusCode: '500'),
      ),
    );

    // Act
    final result = await usecase();

    expect(
      result,
      equals(
        const Left<Failure, dynamic>(
          ServerFailure(message: 'Unknown Error Occured', statusCode: '500'),
        ),
      ),
    );

    verify(() => repo.cacheFirstTimer()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
