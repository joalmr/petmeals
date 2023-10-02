import 'package:cached_network_image/cached_network_image.dart';
import 'package:comfypet/app/domain/pet/model/pet_model.dart';
import 'package:comfypet/app/domain/pet/pet_provider.dart';
import 'package:comfypet/app/views/get_it/home/widgets/add_pet.home.dart';
import 'package:comfypet/app/views/get_it/home/widgets/card_pet.home.dart';
import 'package:comfypet/app/views/get_it/setup.get_it.dart';
import 'package:flutter/material.dart';

class ListPetWidget extends StatelessWidget {
  const ListPetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = getIt<PetProvider>();

    return StreamBuilder<List<PetModel>>(
      stream: petProvider.loadStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final petData = snapshot.data!;

        if (petData.isEmpty) {
          return const Center(
            child: Text('No tiene datos'),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const AddPetWidget(),
                    Row(
                      children: [
                        for (final element in petData)
                          Container(
                            margin: const EdgeInsets.all(4),
                            child: GestureDetector(
                              onTap: () => petProvider.myPet(element),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(100)),
                                child: Stack(
                                  children: [
                                    Image(
                                      image: CachedNetworkImageProvider(element.photo!),
                                      height: 52,
                                      width: 52,
                                      fit: BoxFit.cover,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CardPetWidget(),
              ),
            ],
          ),
        );
      },
    );
  }
}
