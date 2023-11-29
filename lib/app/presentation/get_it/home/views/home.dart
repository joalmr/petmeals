import 'package:petmeals/app/presentation/get_it/home/widgets/list_pet.home.dart';
import 'package:petmeals/app/presentation/get_it/home/widgets/saludo.home.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
