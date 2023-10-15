import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:edu_app/core/errors/failiure.dart';
import 'package:edu_app/src/on_boarding/domain/usecase/cache_first_timer.dart';
import 'package:edu_app/src/on_boarding/domain/usecase/check_if_user_first_timer.dart';
import 'package:edu_app/src/on_boarding/presentation/cubit/on_board_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCacheFirstTimer extends Mock implements CacheFirstTimer {}

class MockCheckIfUserIsFirstTimer extends Mock
    implements CheckIfUserIsFirstTimer {}

void main() {
  late CacheFirstTimer cacheFirstTimer;
  late CheckIfUserIsFirstTimer checkIfUserIsFirstTimer;
  late OnBoardCubit cubit;

  setUp(() {
    cacheFirstTimer = MockCacheFirstTimer();
    checkIfUserIsFirstTimer = MockCheckIfUserIsFirstTimer();
    cubit = OnBoardCubit(
      cacheFirstTimer: cacheFirstTimer,
      checkIfUserIsFirstTimer: checkIfUserIsFirstTimer,
    );
  });

  const tFailure = CacheFailure(
    message: 'Insufficient storage permission',
    statusCode: '4032',
  );

  test('initial state should be [OnBoardingInitial]', () {
    expect(cubit.state, const OnBoardInitial());
  });

  group('cacheFirstTimer', () {
    blocTest<OnBoardCubit, OnBoardState>(
      'should emit [CachingFirstTimer, UserCached] when successful',
      build: () {
        when(() => cacheFirstTimer()).thenAnswer(
          (_) async => const Right(null),
        );
        return cubit;
      },
      act: (cubit) => cubit.cacheFirstTimer(),
      expect: () => const [
        CachingFirstTimer(),
        UserCached(),
      ],
      verify: (_) {
        verify(() => cacheFirstTimer()).called(1);
        verifyNoMoreInteractions(cacheFirstTimer);
      },
    );

    blocTest<OnBoardCubit, OnBoardState>(
      'should emit '
      '[CachingFirstTimer, OnBoardingError] when unsuccessful',
      build: () {
        when(() => cacheFirstTimer()).thenAnswer(
          (_) async => const Left(tFailure),
        );
        return cubit;
      },
      act: (cubit) => cubit.cacheFirstTimer(),
      expect: () => [
        const CachingFirstTimer(),
        OnBoardError(tFailure.errorMessage),
      ],
      verify: (_) {
        verify(() => cacheFirstTimer()).called(1);
        verifyNoMoreInteractions(cacheFirstTimer);
      },
    );
  });

  group('checkIfUserIsFirstTimer', () {
    blocTest<OnBoardCubit, OnBoardState>(
      'should emit [CheckingIfUserIsFirstTimer, OnBoardingStatus] '
      'when successful',
      build: () {
        when(() => checkIfUserIsFirstTimer()).thenAnswer(
          (_) async => const Right(false),
        );
        return cubit;
      },
      act: (cubit) => cubit.checkingIfUserIsFirstTimer(),
      expect: () => const [
        CheckingIfUserIsFirstTimer(),
        OnBoardStatus(isFirstTime: false),
      ],
      verify: (_) {
        verify(() => checkIfUserIsFirstTimer()).called(1);
        verifyNoMoreInteractions(checkIfUserIsFirstTimer);
      },
    );

    blocTest<OnBoardCubit, OnBoardState>(
      'should emit [CheckingIfUserIsFirstTImer, OnBoardingState(true)] when '
      'unsuccessful',
      build: () {
        when(() => checkIfUserIsFirstTimer()).thenAnswer(
          (_) async => const Left(tFailure),
        );
        return cubit;
      },
      act: (cubit) => cubit.checkingIfUserIsFirstTimer(),
      expect: () => const [
        CheckingIfUserIsFirstTimer(),
        OnBoardStatus(isFirstTime: true),
      ],
      verify: (_) {
        verify(() => checkIfUserIsFirstTimer()).called(1);
        verifyNoMoreInteractions(checkIfUserIsFirstTimer);
      },
    );
  });
}
