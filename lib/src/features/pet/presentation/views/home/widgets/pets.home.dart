import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:petmeals/src/core/app/styles/colors/colors.dart';
import 'package:petmeals/src/features/pet/presentation/views/home/widgets/add_pet.home.dart';
import 'package:petmeals/src/features/pet/presentation/views/home/widgets/card_pet.home.dart';
import 'package:petmeals/src/features/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/src/features/pet/presentation/views/home/widgets/next_attentions.dart';
import 'package:petmeals/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PetsWidget extends StatelessWidget {
  const PetsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();
    final petData = petProvider.pets;

    if (petProvider.loading) {
      return Center(
        child: Lottie.asset(
          'assets/loading.json',
          width: 64,
        ),
      );
    }

    if (petData.isEmpty) {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No tienes mascotas registradas'),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: ButtonPrimary(
                onPressed: () => context.push('/add', extra: false),
                child: const Text("Agregar mascota"),
              ),
            ),
          ],
        ),
      );
    }

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 72,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 4,
                  bottom: 20,
                ),
                child: const AddPetWidget(),
              ),
              SizedBox(
                height: 72,
                child: ListView.builder(
                  itemCount: petData.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final element = petData[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: GestureDetector(
                        onTap: () => petProvider.runPet(element),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(100)),
                              child: Stack(
                                children: [
                                  element.photo == null
                                      ? Container(
                                          decoration: const BoxDecoration(
                                              color: kPrimaryColor),
                                          // height: 120,
                                          child: const Center(
                                            child: Icon(
                                              Icons.photo,
                                              size: 42,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      : Image(
                                          image: CachedNetworkImageProvider(
                                              element.photo!),
                                          height: 52,
                                          width: 52,
                                          fit: BoxFit.cover,
                                        ),
                                ],
                              ),
                            ),
                            Text(
                              element.name!,
                              style: TextStyle(
                                color:
                                    element == context.watch<PetProvider>().pet
                                        ? kPrimaryColor
                                        : const Color(0xFFAEAEAE),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: CardPetWidget(),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(24, 8, 24, 16),
          child: Text(
            'Próximas atenciones',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const NextAttentions(),
        const SizedBox(height: 12),
      ],
    );
  }
}
