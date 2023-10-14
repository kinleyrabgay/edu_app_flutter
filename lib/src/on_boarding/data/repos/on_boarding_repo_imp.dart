import 'package:dartz/dartz.dart';
import 'package:edu_app/core/errors/exception.dart';
import 'package:edu_app/core/errors/failiure.dart';
import 'package:edu_app/core/utils/typedef.dart';
import 'package:edu_app/src/on_boarding/data/datasource/on_boarding_local_datasource.dart';
import 'package:edu_app/src/on_boarding/domain/repos/on_boarding_repo.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  const OnBoardingRepoImpl(this._localDataSource);

  final OnBoardingLocalDataSource _localDataSource;

  @override
  ResultFuture<void> cacheFirstTimer() async {
    try {
      await _localDataSource.cacheFirstTimer();
      // Return Right(null);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() {
    // TODO: implement checkIfUserIsFirstTimer
    throw UnimplementedError();
  }
}
