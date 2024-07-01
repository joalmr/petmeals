import 'package:flutter/material.dart';
import 'package:petmeals/src/features/pet/presentation/views/home/widgets/pets.home.dart';
import 'package:petmeals/src/shared/views/ads_view.dart';
import 'package:petmeals/src/features/pet/presentation/views/home/widgets/saludo.home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AdsView(
      child: ListView(
        children: const [
          SaludoWidget(),
          SizedBox(height: 8),
          PetsWidget(),
        ],
      ),
    );
  }
}
