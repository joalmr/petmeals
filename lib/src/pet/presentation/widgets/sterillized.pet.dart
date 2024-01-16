import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
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
    final petProvider = context.read<PetProvider>();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        children: [
          const Text(
            'Esterilizado',
            style: TextStyle(color: kTextColor),
          ),
          const SizedBox(width: 110),
          CupertinoSwitch(
              activeColor: kPrimaryColor,
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
