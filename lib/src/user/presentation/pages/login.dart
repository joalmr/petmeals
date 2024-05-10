import 'package:flutter/material.dart';
import 'package:petmeals/src/user/presentation/widgets/btn.login.dart';
import 'package:petmeals/src/user/presentation/widgets/intro.login.dart';
// import 'package:petmeals/src/user/presentation/widgets/logo.login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 0, bottom: 0),
                  width: double.maxFinite,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // LogoWidget(),
                      // SizedBox(height: 8.5),
                      IntroWidget(),
                      SizedBox(height: 32),
                      ButtonGoogle(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
