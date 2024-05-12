import 'package:flutter/material.dart';
import 'package:petmeals/ads_view.dart';
import 'package:petmeals/src/pet/presentation/pages/home/widgets/list_pet.home.dart';
import 'package:petmeals/src/pet/presentation/pages/home/widgets/saludo.home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdsView(
      child: const Column(
        children: [
          SaludoWidget(),
          SizedBox(height: 12),
          ListPetWidget(),
        ],
      ),
    );
  }
}
