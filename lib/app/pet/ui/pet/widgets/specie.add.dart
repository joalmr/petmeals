import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:comfypet/config/components/widgets/button/primary.button.dart';
import 'package:flutter/material.dart';

class SpeciePetWidget extends StatefulWidget {
  const SpeciePetWidget({super.key});

  @override
  State<SpeciePetWidget> createState() => _SpeciePetWidgetState();
}

class _SpeciePetWidgetState extends State<SpeciePetWidget> {
  bool specie = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Especie",
            style: TextStyle(color: textoColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonPrimary(
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/cat.png",
                      color: !specie ? primerColor : textoColorContraste,
                      height: 32,
                    ),
                    Text(
                      "Gato",
                      style: TextStyle(
                        color: !specie ? primerColor : textoColorContraste,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    specie = false;
                  });
                },
              ),
              const SizedBox(width: 20),
              ButtonPrimary(
                color: Colors.white,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/dog.png",
                      height: 32,
                      color: specie ? primerColor : textoColorContraste,
                    ),
                    Text(
                      "Perro",
                      style: TextStyle(
                        color: specie ? primerColor : textoColorContraste,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    specie = true;
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
