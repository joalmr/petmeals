import 'package:flutter/material.dart';

class IntroLogin extends StatelessWidget {
  const IntroLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Image(
            image: AssetImage('assets/images/intro.png'),
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 12),
        Center(
          child: Text(
            '''Te ayudamos a cuidar 
a tu mascota''',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 12),
        Center(
          child: Text(
            'No te preocupes por recordar cada cuidado que tu mascota necesita, lo hacemos por ti',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
