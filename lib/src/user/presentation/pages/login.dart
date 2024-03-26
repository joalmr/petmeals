import 'package:flutter/material.dart';
import 'package:petmeals/src/user/presentation/widgets/btn.login.dart';
import 'package:petmeals/src/user/presentation/widgets/intro.login.dart';
import 'package:petmeals/src/user/presentation/widgets/logo.login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 25, bottom: 0),
                  width: double.maxFinite,
                  child: ListView(
                    children: const [
                      LogoWidget(),
                      SizedBox(height: 8.5),
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
