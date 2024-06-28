// ignore_for_file: constant_pattern_never_matches_value_type

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import 'package:store_api/components/rounded_buttons.dart';
import 'package:store_api/constant.dart';

import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  static const String id = 'login_page';

  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final LoginBloc loginBloc = LoginBloc();
  bool usernameError = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String newUsername = 'mor_2314';
    // String newUsername = '';
    // String newPassword = '';
    String newPassword = '83r5^_';
    return BlocProvider<LoginBloc>.value(
      value: loginBloc,
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: Colors.white,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            switch (state.runtimeType) {
              case LoginLoading:
                const Center(child: CircularProgressIndicator());

              case LoginSuccess:
                QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    text: 'Login Success',
                    onConfirmBtnTap: () =>
                        Navigator.pushNamed(context, 'home_page'));
                break;
              case LoginError:
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  title: 'Oops...',
                  text: 'Sorry, something went wrong',
                );
                break;
              default:
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.error,
                  title: 'Oops...',
                  text: 'Sorry, something went wrong',
                );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextField(
                    controller: usernameController,
                    onChanged: (value) {
                      print(value);
                      newUsername = value;
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your username',
                      errorText: usernameError
                          ? 'Please enter a valid username'
                          : null,
                      errorStyle: const TextStyle(color: Colors.red),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    controller: passwordController,
                    onChanged: (value) {
                      newPassword = value;
                      print(value);
                    },
                    obscureText: true,
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password'),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  RoundedBtn(
                    color: Colors.deepOrangeAccent,
                    onTap: () {
                      if (newUsername.isEmpty || newPassword.isEmpty) {
                        // Show error message if email or password is empty
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Please fill in both username and password'),
                          ),
                        );
                      } else {
                        loginBloc
                            .add(LoginButtonPressed(newUsername, newPassword));
                      }
                    },
                    title: 'Log In',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // bool _isValidEmail(String email) {
  //   // Regular expression for email validation
  //   final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  //   return emailRegex.hasMatch(email);
  // }
}
