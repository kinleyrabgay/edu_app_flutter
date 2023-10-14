import 'package:edu_app/core/usecases/usecase.dart';
import 'package:edu_app/core/utils/typedef.dart';
import 'package:edu_app/src/on_boarding/domain/repos/on_boarding_repo.dart';

class CacheFirstTimer extends UseCaseWithoutParams<void> {
  const CacheFirstTimer(this._repo);

  final OnBoardingRepo _repo;

  @override
  ResultFuture<void> call() async => _repo.cacheFirstTimer();
}
