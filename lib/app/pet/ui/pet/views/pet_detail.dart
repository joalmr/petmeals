import 'package:cached_network_image/cached_network_image.dart';
import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/app/pet/ui/pet/widgets/delete.pet.dart';
import 'package:comfypet/config/components/widgets/button/back.button.dart';
import 'package:comfypet/app/pet/ui/pet/widgets/picture.pet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetDetailView extends StatelessWidget {
  const PetDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PicturePet(
              buttonLeft: const BackBtn(),
              buttonRight: const DeletePetWidget(),
              aspectRatio: 4 / 3,
              child: Image(
                image: CachedNetworkImageProvider(petProvider.pet!.photo!),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
