import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:comfypet/app/pet/domain/model/pet_model.dart';
import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPetWidget extends StatelessWidget {
  final PetModel pet;
  const CardPetWidget({
    super.key,
    required this.pet,
  });

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();

    return GestureDetector(
      onTap: () {
        petProvider.myPet(pet);
        Navigator.pushNamed(context, "/petdetail");
        log("->go to ProfilePet");
      },
      child: Stack(
        children: [
          Image(
            image: CachedNetworkImageProvider(pet.photo!),
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 45,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.black54,
              ),
              child: Center(
                child: Text(
                  pet.name!,
                  style: const TextStyle(
                    color: fondoColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
