import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/app/domain/pet/pet_provider.dart';
import 'package:petmeals/app/presentation/get_it/pet/widgets/picture.pet.dart';
import 'package:petmeals/app/presentation/setup.get_it.dart';
import 'package:petmeals/config/components/widgets/button/back.button.dart';
import 'package:petmeals/config/components/widgets/button/primary.button.dart';

class LitterPetWidget extends StatefulWidget {
  const LitterPetWidget({super.key});

  @override
  State<LitterPetWidget> createState() => _LitterPetWidgetState();
}

class _LitterPetWidgetState extends State<LitterPetWidget> {
  double litter = 1;

  @override
  Widget build(BuildContext context) {
    final petProvider = getIt<PetProvider>();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            PicturePet(
              buttonLeft: const BackBtn(),
              aspectRatio: 3 / 4,
              child: Hero(
                tag: 'imgpet',
                child: Image(
                  image: CachedNetworkImageProvider(petProvider.pet!.photo!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Cambios de arena',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text('¿Cuántas veces al día?'),
            Slider(
              value: litter,
              max: 2,
              min: 1,
              divisions: 1,
              label: litter.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  litter = value;
                });
              },
            ),
            const SizedBox(height: 12),
            const Text('¿En qué horarios?'),
            const SizedBox(height: 12),
            Visibility(
              visible: litter == 1 || litter == 2 || litter == 3,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: CupertinoTextField(
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontSize: 14,
                    overflow: TextOverflow.fade,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: litter == 2 || litter == 3,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: CupertinoTextField(
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontSize: 14,
                    overflow: TextOverflow.fade,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: litter == 3,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: CupertinoTextField(
                  placeholderStyle: TextStyle(
                    color: CupertinoColors.systemGrey,
                    fontSize: 14,
                    overflow: TextOverflow.fade,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            ButtonPrimary(
              onPressed: () {},
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
