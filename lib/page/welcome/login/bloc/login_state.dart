import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginState extends Equatable {}

abstract class AuthState extends Equatable {}

class LoginInitial extends LoginState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends LoginState with EquatableMixin {
  final bool isLogin;

  LoginSuccess(this.isLogin);

  @override
  List<Object?> get props => [isLogin];
}

class LoginError extends LoginState with EquatableMixin {
  @override
  List<Object?> get props => [];
}

class AuthLoading extends AuthState with EquatableMixin {
  @override
  List<Object?> get props => [];
}
