import 'package:edu_app/core/usecases/usecase.dart';
import 'package:edu_app/core/utils/typedef.dart';
import 'package:edu_app/src/on_boarding/domain/repos/on_boarding_repo.dart';

// Return bool
class CheckIfUserIsFirstTimer extends UseCaseWithoutParams<bool> {
  const CheckIfUserIsFirstTimer(this._repo);

  final OnBoardingRepo _repo;

  @override
  ResultFuture<bool> call() => _repo.checkIfUserIsFirstTimer();
}
