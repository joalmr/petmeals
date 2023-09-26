import 'dart:developer';

import 'package:comfypet/app/user/ui/widgets/btn.login.dart';
import 'package:comfypet/app/user/ui/widgets/intro.login.dart';
import 'package:comfypet/app/user/ui/widgets/logo.login.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    log('login *');
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
