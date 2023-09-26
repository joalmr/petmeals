import 'package:cached_network_image/cached_network_image.dart';
import 'package:comfypet/app/pet/domain/model/pet_model.dart';
import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/app/pet/ui/home/widgets/add_pet.home.dart';
import 'package:comfypet/app/pet/ui/home/widgets/card_pet.home.dart';
import 'package:comfypet/providers.main.dart';
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
