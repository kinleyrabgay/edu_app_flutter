import 'package:dartz/dartz.dart';
import 'package:edu_app/src/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:edu_app/src/on_boarding/domain/usecase/check_if_user_first_timer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'onboarding_repo_mock.dart';

void main() {
  // Depedency
  late OnBoardingRepo repo;

  // Usecase
  late CheckIfUserIsFirstTimer usecase;

  setUp(() {
    repo = MockOnBoardingRepo();
    usecase = CheckIfUserIsFirstTimer(repo);
  });

  test('should call the [OnboardingRepo.checkIFUserIsFirstTimer]', () async {
    when(() => repo.checkIfUserIsFirstTimer()).thenAnswer(
      (_) async => right(true),
    );

    // Act
    final result = await usecase();

    expect(result, equals(const Right<dynamic, bool>(true)));

    verify(() => repo.checkIfUserIsFirstTimer()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
