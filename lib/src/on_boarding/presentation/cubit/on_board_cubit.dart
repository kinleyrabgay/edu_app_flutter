import 'package:bloc/bloc.dart';
import 'package:edu_app/src/on_boarding/domain/usecase/cache_first_timer.dart';
import 'package:edu_app/src/on_boarding/domain/usecase/check_if_user_first_timer.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'on_board_state.dart';

class OnBoardCubit extends Cubit<OnBoardState> {
  OnBoardCubit({
    required CheckIfUserIsFirstTimer checkIfUserIsFirstTimer,
    required CacheFirstTimer cacheFirstTimer,
  })  : _cacheFirstTimer = cacheFirstTimer,
        _checkIfUserIsFirstTimer = checkIfUserIsFirstTimer,
        super(const OnBoardInitial());

  final CacheFirstTimer _cacheFirstTimer;
  final CheckIfUserIsFirstTimer _checkIfUserIsFirstTimer;

  // Method
  Future<void> cacheFirstTimer() async {
    emit(const CachingFirstTimer());
    final result = await _cacheFirstTimer();

    result.fold(
      (failure) => emit(OnBoardError(failure.errorMessage)),
      (_) => emit(const UserCached()),
    );
  }

  // First timer
  Future<void> checkingIfUserIsFirstTimer() async {
    emit(const CheckingIfUserIsFirstTimer());
    final result = await _checkIfUserIsFirstTimer();

    result.fold(
      (failure) => emit(const OnBoardStatus(isFirstTime: false)),
      (status) => emit(OnBoardStatus(isFirstTime: status)),
    );
  }
}
