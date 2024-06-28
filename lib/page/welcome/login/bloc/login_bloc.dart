import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:store_api/page/welcome/login/bloc/login_state.dart';
import 'package:store_api/repos/auth_service.dart';

part 'login_event.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final isLogin = await AuthService.login(event.username, event.password);
        if (isLogin) {
          emit(LoginSuccess(isLogin));
        } else {
          emit(LoginError());
        }
      } catch (error) {
        emit(LoginError());
      }
    });

    on<ClearError>((event, emit) => emit(LoginInitial()));
  }
}
