import 'package:petmeals/app/domain/pet/pet_provider.dart';
import 'package:petmeals/global.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:provider/provider.dart';
// import 'package:petmeals/setup.get_it.dart';

class SpeciePetWidget extends StatefulWidget {
  const SpeciePetWidget({super.key});
  // final int? specie;

  @override
  State<SpeciePetWidget> createState() => _SpeciePetWidgetState();
}

class _SpeciePetWidgetState extends State<SpeciePetWidget> {
  @override
  Widget build(BuildContext context) {
    final petProvider = context.read<PetProvider>();

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Especie',
            style: TextStyle(color: textoColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonPrimary(
                platformApp: Global.platformApp,
                color: Colors.white,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/icons/cat.svg',
                      colorFilter: ColorFilter.mode(
                          petProvider.specie == 0
                              ? primerColor
                              : textoColorContraste,
                          BlendMode.srcIn),
                      height: 32,
                    ),
                    Text(
                      'Gato',
                      style: TextStyle(
                        color: petProvider.specie == 0
                            ? primerColor
                            : textoColorContraste,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    petProvider.specie = 0;
                  });
                },
              ),
              const SizedBox(width: 20),
              ButtonPrimary(
                platformApp: Global.platformApp,
                color: Colors.white,
                child: Column(
                  children: [
                    SvgPicture.asset(
                      'assets/images/icons/dog.svg',
                      colorFilter: ColorFilter.mode(
                          petProvider.specie == 1
                              ? primerColor
                              : textoColorContraste,
                          BlendMode.srcIn),
                      height: 32,
                    ),
                    Text(
                      'Perro',
                      style: TextStyle(
                        color: petProvider.specie == 1
                            ? primerColor
                            : textoColorContraste,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    petProvider.specie = 1;
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
