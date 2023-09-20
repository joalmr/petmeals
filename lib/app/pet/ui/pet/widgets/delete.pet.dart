import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeletePetWidget extends StatelessWidget {
  const DeletePetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();

    return CupertinoButton(
      color: fondoColor.withOpacity(0.8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: const Icon(
        Icons.delete_forever_rounded,
        color: CupertinoColors.systemGrey,
      ),
      onPressed: () {
        petProvider.deletePet(petProvider.pet!.id!);
        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
      },
    );
  }
}
