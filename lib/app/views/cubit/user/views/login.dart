import 'dart:developer';
import 'package:comfypet/app/domain/user/cubit/user_cubit.dart';
import 'package:comfypet/app/views/get_it/user/widgets/btn.login.dart';
import 'package:comfypet/app/views/get_it/user/widgets/intro.login.dart';
import 'package:comfypet/app/views/get_it/user/widgets/logo.login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    log('login *');
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoaded) {
          Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
        }
      },
      builder: (context, state) {
        if (state is UserLoading) {
          return const Scaffold(
            body: SafeArea(
                child: Center(
              child: CircularProgressIndicator(),
            )),
          );
        }
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
      },
    );
  }
}
