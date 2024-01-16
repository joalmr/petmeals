import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:petmeals/global.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SexPetWidget extends StatefulWidget {
  const SexPetWidget({super.key});

  @override
  State<SexPetWidget> createState() => _SexPetWidgetState();
}

class _SexPetWidgetState extends State<SexPetWidget> {
  @override
  Widget build(BuildContext context) {
    final petProvider = context.read<PetProvider>();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sexo',
            style: TextStyle(color: kTextColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonPrimary(
                platformApp: Global.platformApp,
                color: Colors.white,
                child: Column(
                  children: [
                    Icon(Icons.female,
                        color: !petProvider.sex
                            ? kPrimaryColor
                            : kTextColorContrast),
                    Text(
                      'Hembra',
                      style: TextStyle(
                        color: !petProvider.sex
                            ? kPrimaryColor
                            : kTextColorContrast,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    petProvider.sex = false;
                  });
                },
              ),
              const SizedBox(width: 20),
              ButtonPrimary(
                platformApp: Global.platformApp,
                color: Colors.white,
                child: Column(
                  children: [
                    Icon(Icons.male,
                        color: petProvider.sex
                            ? kPrimaryColor
                            : kTextColorContrast),
                    Text(
                      'Macho',
                      style: TextStyle(
                        color: petProvider.sex
                            ? kPrimaryColor
                            : kTextColorContrast,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    petProvider.sex = true;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
