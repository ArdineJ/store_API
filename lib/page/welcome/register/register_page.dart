import 'package:flutter/material.dart';
import 'package:store_api/components/rounded_buttons.dart';
import 'package:store_api/constant.dart';

class RegistrationPage extends StatelessWidget {
  static const String id = 'register_page';

  const RegistrationPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Hero(
            //   tag: 'logo',
            //   child: SizedBox(
            //     height: 200.0,
            //     child: Image.asset('images/logo.png'),
            //   ),
            // // ),
            // const SizedBox(
            //   height: 48.0,
            // ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
            ),
            const SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password'),
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundedBtn(
              color: Colors.orangeAccent,
              onTap: () {},
              title: 'Register',
            ),
          ],
        ),
      ),
    );
  }
}
