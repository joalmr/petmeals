import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/app/domain/pet/pet_provider.dart';
import 'package:petmeals/app/presentation/get_it_views/pet/widgets/actions/food.dart';
import 'package:petmeals/app/presentation/get_it_views/pet/widgets/actions/leash.dart';
import 'package:petmeals/app/presentation/get_it_views/pet/widgets/actions/litter.dart';
import 'package:petmeals/app/presentation/get_it_views/pet/widgets/delete.pet.dart';
import 'package:petmeals/app/presentation/get_it_views/pet/widgets/picture.pet.dart';
import 'package:petmeals/app/presentation/setup.get_it.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:petmeals/config/components/widgets/button/back.button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PetDetailView extends StatelessWidget with GetItMixin {
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
                buttonRight: const DeletePetWidget(),
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
              Visibility(
                visible:
                    watchOnly((PetProvider p) => p.actions) != 0 ? false : true,
                child: Column(
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
                                    'Hebra',
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
              ),

              // watchOnly((PetProvider p) => p.actions)
              Visibility(
                visible:
                    watchOnly((PetProvider p) => p.actions) != 0 ? false : true,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        petProvider.actionSet(1);
                        Logger().i('Action: ${petProvider.actions}');
                      },
                      child: Container(
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
                    ),
                    GestureDetector(
                      onTap: () {
                        if (petProvider.pet!.specie!.id! == '0') {
                          petProvider.actionSet(2); //gato
                        } else {
                          petProvider.actionSet(3); //perro
                        }
                        Logger().i('Action: ${petProvider.actions}');
                      },
                      child: Container(
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
                    ),
                  ],
                ),
              ),
              Visibility(
                visible:
                    watchOnly((PetProvider p) => p.actions) == 0 ? false : true,
                child: Stack(
                  children: [
                    watchOnly((PetProvider p) => p.actions) == 1
                        ? const FoodPetWidget()
                        : watchOnly((PetProvider p) => p.actions) == 2
                            ? const LitterPetWidget()
                            : const LeashPetWidget(),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: IconButton(
                        onPressed: () {
                          petProvider.actionSet(0);
                          Logger().i('Action: ${petProvider.actions}');
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
