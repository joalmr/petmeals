import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/src/core/styles/colors/colors.dart';
import 'package:petmeals/src/features/pet/domain/entities/pet.dart';

class EditPetWidget extends StatelessWidget {
  const EditPetWidget({
    super.key,
    required this.myPet,
  });
  final PetEntity myPet;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      icon: const Icon(
        Icons.edit,
        color: kTextColorContrast,
      ),
      onPressed: () {
        context.push('/petdetail/update', extra: myPet);
      },
    );
  }
}
