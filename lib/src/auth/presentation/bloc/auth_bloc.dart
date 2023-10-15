import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:edu_app/core/enums/update_user.dart';
import 'package:edu_app/src/auth/domain/entities/user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
