import 'package:comfypet/app/pet/ui/home/widgets/list_pets.home.dart';
import 'package:comfypet/app/pet/ui/home/widgets/pet.home.dart';
import 'package:comfypet/app/pet/ui/home/widgets/saludo.home.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
        child: const Column(
          children: [
            SaludoWidget(),
            SizedBox(height: 25),
            ListPetsWidget(),
            Expanded(child: PetWidget()),
          ],
        ),
      )),
    );
  }
}
