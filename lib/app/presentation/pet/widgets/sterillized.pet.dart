import 'package:petmeals/app/domain/pet/pet_provider.dart';
import 'package:petmeals/setup.get_it.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';

class SterillizedPetWidget extends StatefulWidget {
  const SterillizedPetWidget({super.key});
  // final bool? sterillized;

  @override
  State<SterillizedPetWidget> createState() => _SterillizedPetWidgetState();
}

class _SterillizedPetWidgetState extends State<SterillizedPetWidget> {
  @override
  Widget build(BuildContext context) {
    final petProvider = getIt<PetProvider>();

    // if (widget.sterillized != null) {
    //   petProvider.sterillized = widget.sterillized!;
    // }

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
