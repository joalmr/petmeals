import 'dart:developer';
import 'package:comfypet/app/domain/cubit.dart';
import 'package:comfypet/app/views/cubit/user/widgets/btn.login.dart';
import 'package:comfypet/app/views/cubit/user/widgets/intro.login.dart';
import 'package:comfypet/app/views/cubit/user/widgets/logo.login.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    log('login *');
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoaded) {
          context.read<RouterCubit>().goHome();
        }
      },
      builder: (context, state) {
        if (state is UserLoading) {
          return const Scaffold(
            body: SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 25),
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
      },
    );
  }
}
