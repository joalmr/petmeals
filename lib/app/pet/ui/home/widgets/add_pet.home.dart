import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class AddPetWidget extends StatelessWidget {
  const AddPetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      onTap: () {
        Navigator.pushNamed(context, "/add");
        developer.log("-> Agregar mascota");
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Container(
          height: 52,
          width: 52,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            color: fondoColor,
          ),
          padding: const EdgeInsets.all(10),
          child: const Center(
            child: Image(
              image: AssetImage('assets/images/add-pet.png'),
              height: 35,
              width: 35,
              fit: BoxFit.scaleDown,
              // color: subColor,
            ),
          ),
        ),
      ),
    );
  }
}
