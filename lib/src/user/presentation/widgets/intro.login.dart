import 'package:flutter/material.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

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
            'Agenda los cuidados\n'
            'de tu mascota',
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
            'Conviértete en el mejor petlover con nuestra app de recordatorios',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
