import 'package:edu_app/core/usecases/usecase.dart';
import 'package:edu_app/core/utils/typedef.dart';
import 'package:edu_app/src/auth/domain/repos/auth_repo.dart';

class ForgotPassword extends UseCaseWithParams<void, String> {
  const ForgotPassword(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(String params) => _repo.forgotPassword(params);
}