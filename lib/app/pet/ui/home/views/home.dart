import 'dart:developer';
import 'package:comfypet/app/pet/ui/home/widgets/list_pet.home.dart';
import 'package:comfypet/app/pet/ui/home/widgets/saludo.home.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    log('home *');
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SaludoWidget(),
            SizedBox(height: 12),
            Expanded(
              child: ListPetWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
