import 'package:go_router/go_router.dart';
import 'package:petmeals/app/domain/pet/pet_provider.dart';
// import 'package:petmeals/app/presentation/pet/views/pet_add.dart';
import 'package:petmeals/setup.get_it.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPetWidget extends StatelessWidget {
  const EditPetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = getIt<PetProvider>();

    return CupertinoButton(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: const Icon(
        Icons.edit,
        color: CupertinoColors.systemGrey,
      ),
      onPressed: () {
        context.push('/petdetail/update', extra: petProvider.pet);
      },
    );
  }
}