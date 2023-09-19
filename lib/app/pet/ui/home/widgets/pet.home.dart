import 'package:comfypet/app/pet/domain/model/pet_model.dart';
import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/app/pet/ui/home/widgets/card_pet.home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:provider/provider.dart';

class PetWidget extends StatelessWidget {
  const PetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: LiquidSwipe(
          positionSlideIcon: 0.8,
          slideIconWidget: const Icon(
            Icons.arrow_back_ios_new,
            color: CupertinoColors.systemGrey,
          ),
          pages: [
            for (PetModel pet in petProvider.myPets) CardPetWidget(pet: pet),
          ],
        ),
      ),
    );
  }
}
