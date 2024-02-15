import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/actions/food.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/actions/leash.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/actions/litter.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/attentions/deworming.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/attentions/grooming.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/attentions/vaccine.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/config/components/widgets/button/buttons.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:petmeals/config/components/utils/for_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmeals/src/pet/presentation/widgets/edit.pet.dart';
import 'package:petmeals/src/pet/presentation/widgets/picture.pet.dart';
import 'package:provider/provider.dart';

class PetDetailPage extends StatelessWidget {
  const PetDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.read<PetProvider>();
    final petWatch = context.watch<PetProvider>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: SafeArea(
          child: PicturePet(
            buttonLeft: const BackBtn(),
            buttonRight: const EditPetWidget(),
            aspectRatio: 3 / 4,
            child: Hero(
              tag: 'imgpet',
              child: Image(
                image: CachedNetworkImageProvider(petProvider.pet!.photo!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                petProvider.pet!.name!,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${petProvider.pet!.age!} ${petProvider.pet!.age == 1 ? 'año' : 'años'}',
                style: const TextStyle(
                    color: kPrimaryColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      petProvider.pet!.specie! == 0
                          ? Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/icons/cat.svg',
                                  height: 42,
                                ),
                                const Text(
                                  'Gato',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/icons/dog.svg',
                                  height: 42,
                                ),
                                const Text(
                                  'Perro',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                      const SizedBox(width: 18),
                      petProvider.pet!.sex!
                          ? const Column(
                              children: [
                                Icon(
                                  Icons.male,
                                  color: Colors.black,
                                  size: 42,
                                ),
                                Text(
                                  'Macho',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            )
                          : const Column(
                              children: [
                                Icon(
                                  Icons.female,
                                  color: Colors.black,
                                  size: 42,
                                ),
                                Text(
                                  'Hembra',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                      const SizedBox(width: 18),
                      GestureDetector(
                        onTap: () {
                          Logger().i('==> Abre Historial');
                          petProvider.getAttentions(petProvider.pet!.id!);
                          context.push('/petdetail/history',
                              extra: petProvider.pet);
                        },
                        child: const Column(
                          children: [
                            Icon(
                              Icons.book_outlined,
                              color: Colors.black,
                              size: 42,
                            ),
                            Text(
                              'Historial',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    petProvider.pet!.sterillized!
                        ? 'Estirilizado'
                        : 'No esterilizado',
                  ),
                  const SizedBox(height: 24),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Logger().i('Desparasitacion');
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (ctx) {
                          return const DewormingPage();
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffF3F3DE),
                          ),
                          width: 64,
                          height: 64,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/icono/desparasitacion.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Logger().i('Grooming');
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return const GroomingPage();
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffF3F3DE),
                          ),
                          width: 64,
                          height: 64,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/icono/grooming.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Logger().i('Vacuna');

                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return const VaccinePage();
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffF3F3DE),
                          ),
                          width: 64,
                          height: 64,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/icono/vacuna.png',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Logger().i('Action: food');
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return const FoodPetPage();
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffF3F3DE),
                          ),
                          height: 145,
                          width: 120,
                          child: SvgPicture.asset(
                            'assets/images/icons/pet-food.svg',
                          ),
                        ),
                        forElements(petWatch.pet!.foods, 'pet-food.svg')
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (petProvider.pet!.specie == 0) {
                        showModalBottomSheet(
                          context: context,
                          builder: (ctx) {
                            return const LitterPetPage();
                          },
                        );
                      } else {
                        showModalBottomSheet(
                          context: context,
                          builder: (ctx) {
                            return const LeashPetPage();
                          },
                        );
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: const Color(0xffF3F3DE),
                          ),
                          height: 145,
                          width: 120,
                          child: SvgPicture.asset(
                            petProvider.pet!.specie! == 0
                                ? 'assets/images/icons/cat-litter.svg'
                                : 'assets/images/icons/leash.svg',
                          ),
                        ),
                        forElements(
                            petWatch.pet!.actions,
                            petProvider.pet!.specie == 0
                                ? 'cat-litter.svg'
                                : 'leash.svg')
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
