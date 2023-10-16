import 'package:edu_app/core/common/views/page_under_construction.dart';
import 'package:edu_app/core/extensions/context_extension.dart';
import 'package:edu_app/core/services/injection_container.dart';
import 'package:edu_app/src/auth/data/model/user_model.dart';
import 'package:edu_app/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:edu_app/src/auth/presentation/screen/sign_in_screen.dart';
import 'package:edu_app/src/auth/presentation/screen/sign_up_screen.dart';
import 'package:edu_app/src/dashboard/presentation/screen/dashboard_screen.dart';
import 'package:edu_app/src/on_boarding/data/datasource/on_boarding_local_datasource.dart';
import 'package:edu_app/src/on_boarding/presentation/cubit/on_board_cubit.dart';
import 'package:edu_app/src/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as fui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'routes.main.dart';
