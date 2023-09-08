import 'package:comfypet/app/pet/data/local/pets_list.dart';
import 'package:comfypet/app/pet/domain/pet.provider.dart';
import 'package:comfypet/app/pet/ui/home/widgets/add_pet.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPetsWidget extends StatelessWidget {
  const ListPetsWidget({super.key});

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
              child: Consumer<PetProvider>(
                builder: (context, state, child) {
                  return Row(
                    children: [
                      for (var elemento in petsTest)
                        GestureDetector(
                          onTap: () => state.myPet(elemento),
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
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
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
