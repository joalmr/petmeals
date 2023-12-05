import 'package:cached_network_image/cached_network_image.dart';
import 'package:petmeals/app/data/pet/models/pet_model.dart';
import 'package:petmeals/app/domain/pet/pet_provider.dart';
import 'package:petmeals/app/presentation/home/widgets/add_pet.home.dart';
import 'package:petmeals/app/presentation/home/widgets/card_pet.home.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:petmeals/global.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
// import 'package:petmeals/setup.get_it.dart';

class ListPetWidget extends StatelessWidget {
  const ListPetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.read<PetProvider>();

    return StreamBuilder<List<PetModel>>(
      stream: petProvider.loadStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData ||
            snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final petData = snapshot.data!;

        if (petData.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonPrimary(
                onPressed: () => context.push('/add'),
                platformApp: Global.platformApp,
                child: const Text("Agregar mascota"),
              ),
              const SizedBox(height: 32),
              const Text('No tiene mascotas'),
            ],
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
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                child: Stack(
                                  children: [
                                    Image(
                                      image: CachedNetworkImageProvider(
                                          element.photo!),
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
              const Expanded(
                child: CardPetWidget(),
              ),
            ],
          ),
        );
      },
    );
  }
}
