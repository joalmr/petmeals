import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/app/domain/pet/pet_provider.dart';
import 'package:petmeals/app/presentation/pet/widgets/edit.pet.dart';
import 'package:petmeals/app/presentation/pet/widgets/picture.pet.dart';
import 'package:petmeals/config/components/widgets/button/buttons.dart';
import 'package:petmeals/setup.get_it.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:petmeals/config/components/utils/for_elements.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:watch_it/watch_it.dart';

class PetDetailView extends StatelessWidget with WatchItMixin {
  PetDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = getIt<PetProvider>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              PicturePet(
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
              const SizedBox(height: 12),
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
                    color: primerColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      petProvider.pet!.specie!.id! == '0'
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
                      const SizedBox(width: 24),
                      petProvider.pet!.sex!
                          ? const Column(
                              children: [
                                Icon(Icons.male, size: 42),
                                Text(
                                  'Macho',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            )
                          : const Column(
                              children: [
                                Icon(Icons.female, size: 42),
                                Text(
                                  'Hembra',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Logger().i('Action: food');
                      context.push('/petdetail/food');
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
                        forElements(petProvider.pet!.foods)
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (petProvider.pet!.specie!.id! == '0') {
                        Logger().i(
                            "Action: arena ${petProvider.pet!.specie!.name}"); //gato
                        context.push('/petdetail/litter');
                      } else {
                        Logger().i(
                            "Action: paseo ${petProvider.pet!.specie!.name}"); //perro
                        context.push('/petdetail/leash');
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
                            petProvider.pet!.specie!.id! == '0'
                                ? 'assets/images/icons/cat-litter.svg'
                                : 'assets/images/icons/leash.svg',
                          ),
                        ),
                        forElements(petProvider.pet!.actions)
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
