import 'package:edu_app/src/on_boarding/data/datasource/on_boarding_local_datasource.dart';
import 'package:edu_app/src/on_boarding/data/repos/on_boarding_repo_imp.dart';
import 'package:edu_app/src/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:edu_app/src/on_boarding/domain/usecase/cache_first_timer.dart';
import 'package:edu_app/src/on_boarding/domain/usecase/check_if_user_first_timer.dart';
import 'package:edu_app/src/on_boarding/presentation/cubit/on_board_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final prefs = await SharedPreferences.getInstance();
  // BLOC (INTER LAYER STATEMANAGEMTN)
  // ONBOARDING
  sl
    ..registerFactory(
      () => OnBoardCubit(checkIfUserIsFirstTimer: sl(), cacheFirstTimer: sl()),
    )

    // Lazy Singleton
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()))

    // REPO -> GIVE IMPL [Interface -> Actual Imple]
    ..registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl(sl()))
    ..registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSrcImpl(sl()),
    )
    ..registerLazySingleton(() => prefs);
}
