import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SterillizedPetWidget extends StatefulWidget {
  const SterillizedPetWidget({super.key});

  @override
  State<SterillizedPetWidget> createState() => _SterillizedPetWidgetState();
}

class _SterillizedPetWidgetState extends State<SterillizedPetWidget> {
  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          const Text(
            'Esterilizado',
            style: TextStyle(color: textoColor),
          ),
          const SizedBox(width: 110),
          CupertinoSwitch(
              activeColor: primerColor,
              value: petProvider.sterillized,
              onChanged: (value) {
                setState(() {
                  petProvider.sterillized = !petProvider.sterillized;
                });
              }),
        ],
      ),
    );
  }
}
