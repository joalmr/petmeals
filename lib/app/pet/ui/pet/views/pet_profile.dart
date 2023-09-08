import 'package:comfypet/app/pet/domain/pet.provider.dart';
import 'package:comfypet/config/components/widgets/button/back.button.dart';
import 'package:comfypet/config/components/widgets/pet/picture.pet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetProfileView extends StatelessWidget {
  const PetProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PicturePet(
              aspectRatio: 4 / 3,
              imageStr: petProvider.pet!.photo,
              buttonLeft: const BackBtn(),
            ),
          ],
        ),
      ),
    );
  }
}
