import 'package:comfypet/app/ui/pages/home/widgets/add_pet.dart';
import 'package:comfypet/config/utils/local/pets_list.dart';
import 'package:flutter/material.dart';
// import 'dart:developer' as developer;

class MascotasWidget extends StatelessWidget {
  const MascotasWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const AddPetWidget(),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var elemento in petsTest)
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: const EdgeInsets.only(right: 8),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 25,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            child: Image(
                              image: AssetImage(elemento.photo!),
                              fit: BoxFit.fill,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
