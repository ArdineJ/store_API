// ignore_for_file: depend_on_referenced_packages, deprecated_member_use, library_private_types_in_public_api

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../components/rounded_buttons.dart';

class WelcomePage extends StatefulWidget {
  static const String id = 'welcome_page';

  const WelcomePage({super.key});
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                // Hero(
                //   tag: 'logo',
                //   child: SizedBox(
                //     height: 60,
                //     child: Image.asset('images/logo.png'),
                //   ),
                // ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Store GWEH',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            RoundedBtn(
              title: 'Login',
              color: Colors.orangeAccent,
              onTap: () {
                Navigator.pushNamed(context, 'login_page');
              },
            ),
            RoundedBtn(
              title: 'Register',
              color: Colors.deepOrangeAccent,
              onTap: () {
                Navigator.pushNamed(context, 'register_page');
              },
            ),
          ],
        ),
      ),
    );
  }
}
