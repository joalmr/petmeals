import 'package:comfypet/src/utils/list_model/test/pets_list.dart';
import 'package:flutter/material.dart';

class MascotasHome extends StatelessWidget {
  const MascotasHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          onTap: () {
            //TODO
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
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (var elemento in petsTest)
                    GestureDetector(
                      onTap: () {
                        //TODO
                      },
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
