import 'package:comfypet/app/ui/pages/home/views/home.dart';
import 'package:comfypet/app/ui/pages/user/widgets/intro.dart';
import 'package:comfypet/app/ui/pages/user/widgets/logo.dart';
import 'package:comfypet/app/ui/widgets/button/other.button.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                    children: [
                      const LogoLogin(), //logo
                      const SizedBox(height: 8.5),
                      const IntroLogin(), //intro
                      const SizedBox(height: 32),
                      ButtonOtherImg(
                        text: 'Ingresar con Google',
                        imagenStr: 'assets/logo/google.jpg',
                        color: Colors.white,
                        onPressed: () {
                          //TODO:
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const HomeView(),
                            ),
                          );
                        },
                      ),
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
