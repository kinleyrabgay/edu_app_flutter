part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class SignInEvent extends AuthEvent {
  const SignInEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}

class SignUpEvent extends AuthEvent {
  const SignUpEvent({
    required this.email,
    required this.password,
    required this.name,
  });

  final String email;
  final String password;
  final String name;

  @override
  List<Object?> get props => [email, password, name];
}

class ForgotPasswordEvent extends AuthEvent {
  const ForgotPasswordEvent({required this.email});

  final String email;

  @override
  List<Object?> get props => [email];
}

class UpdateUserEvent extends AuthEvent {
  const UpdateUserEvent({required this.action, required this.userDate})
      : assert(
          userDate is String || userDate is File,
          '[UserData] must be either String or File ',
        );

  final UpdateUserAction action;
  final dynamic userDate;
  @override
  List<Object?> get props => throw UnimplementedError();
}
