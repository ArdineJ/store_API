part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class LoginButtonPressed extends LoginEvent with EquatableMixin {
  final String username;
  final String password;

  LoginButtonPressed(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class ClearError extends LoginEvent with EquatableMixin {
  @override
  List<Object?> get props => [];
}
