import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petmeals/src/features/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/src/features/pet/presentation/views/home/widgets/stream_pet.home.dart';
import 'package:petmeals/src/shared/views/ads_view.dart';
import 'package:petmeals/src/features/pet/presentation/views/home/widgets/saludo.home.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StreamSubscription subscription;

  @override
  void initState() {
    final petProvider = context.read<PetProvider>();
    subscription = petProvider.loadStream().listen((value) {
      if (value.isNotEmpty) {
        petProvider.myPet(value.first);
        petProvider.getNextAttentions(value.first.id!);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return AdsView(
      child: const Column(
        children: [
          SaludoWidget(),
          SizedBox(height: 12),
          StreamPetWidget(),
        ],
      ),
    );
  }
}
