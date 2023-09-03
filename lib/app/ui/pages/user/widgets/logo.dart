import 'package:flutter/material.dart';

class LogoLogin extends StatelessWidget {
  const LogoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 65,
      child: Image(
        image: AssetImage('assets/logo/comfypet.png'),
        fit: BoxFit.scaleDown,
        height: 112,
        width: 112,
      ),
    );
  }
}
