import 'package:petmeals/app/domain/pet/pet_provider.dart';
import 'package:petmeals/app/views/get_it/setup.get_it.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:petmeals/config/components/widgets/button/primary.button.dart';
import 'package:flutter/material.dart';

class SexPetWidget extends StatefulWidget {
  const SexPetWidget({super.key});

  @override
  State<SexPetWidget> createState() => _SexPetWidgetState();
}

class _SexPetWidgetState extends State<SexPetWidget> {
  @override
  Widget build(BuildContext context) {
    final petProvider = getIt<PetProvider>();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sexo',
            style: TextStyle(color: textoColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonPrimary(
                color: Colors.white,
                child: Column(
                  children: [
                    Icon(Icons.female,
                        color: !petProvider.sex
                            ? primerColor
                            : textoColorContraste),
                    Text(
                      'Hembra',
                      style: TextStyle(
                        color: !petProvider.sex
                            ? primerColor
                            : textoColorContraste,
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
                color: Colors.white,
                child: Column(
                  children: [
                    Icon(Icons.male,
                        color: petProvider.sex
                            ? primerColor
                            : textoColorContraste),
                    Text(
                      'Macho',
                      style: TextStyle(
                        color:
                            petProvider.sex ? primerColor : textoColorContraste,
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
