import 'package:edu_app/core/enums/update_user.dart';
import 'package:edu_app/core/utils/typedef.dart';
import 'package:edu_app/src/auth/domain/entities/user.dart';

abstract class AuthRepo {
  const AuthRepo();

  ResultFuture<void> forgotPassword(String email);

  ResultFuture<LocalUser> signIn({
    required String email,
    required String password,
  });

  ResultFuture<void> signUp({
    required String email,
    required String fullName,
    required String password,
  });

  ResultFuture<void> updateUser({
    // Take userDate as a map (uid update => give uid)
    required UpdateUserAction action,
    required dynamic userData,
  });
}
