import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/app/domain/pet/pet_provider.dart';
import 'package:petmeals/app/presentation/get_it/pet/widgets/picture.pet.dart';
import 'package:petmeals/app/presentation/setup.get_it.dart';
import 'package:petmeals/config/components/widgets/button/back.button.dart';
import 'package:petmeals/config/components/widgets/button/primary.button.dart';

class LeashPetWidget extends StatefulWidget {
  const LeashPetWidget({super.key});

  @override
  State<LeashPetWidget> createState() => _LeashPetWidgetState();
}

class _LeashPetWidgetState extends State<LeashPetWidget> {
  double leash = 1;

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
              'Paseos',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text('¿Cuántas veces al día?'),
            Slider(
              value: leash,
              max: 3,
              min: 1,
              divisions: 2,
              label: leash.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  leash = value;
                });
              },
            ),
            const SizedBox(height: 12),
            const Text('¿En qué horarios?'),
            const SizedBox(height: 12),
            Visibility(
              visible: leash == 1 || leash == 2 || leash == 3,
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
              visible: leash == 2 || leash == 3,
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
              visible: leash == 3,
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
