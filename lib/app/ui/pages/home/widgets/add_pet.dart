import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class AddPetWidget extends StatelessWidget {
  const AddPetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(100)),
      onTap: () {
        developer.log("-> Agregar mascota");
      },
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(100)),
        child: Container(
          height: 50,
          width: 50,
          color: Colors.transparent,
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
