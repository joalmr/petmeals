import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/actions/food.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/actions/leash.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/actions/litter.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/attentions/deworming.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/attentions/grooming.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/attentions/vaccine.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/config/components/widgets/button/buttons.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:petmeals/src/pet/presentation/widgets/edit.pet.dart';
import 'package:provider/provider.dart';

class PetDetailPage extends StatefulWidget {
  const PetDetailPage({super.key});

  @override
  State<PetDetailPage> createState() => _PetDetailPageState();
}

class _PetDetailPageState extends State<PetDetailPage> {
  @override
  Widget build(BuildContext context) {
    final petProvider = context.read<PetProvider>();
    // final petWatch = context.watch<PetProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                const SizedBox(height: 270),
                SizedBox(
                  height: 220,
                  width: double.maxFinite,
                  child: Image(
                    image: CachedNetworkImageProvider(petProvider.pet!.photo!),
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 16,
                  left: 10,
                  child: BackBtn(),
                ),
                const Positioned(
                  top: 16,
                  right: 10,
                  child: EditPetWidget(),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.10,
                  right: MediaQuery.of(context).size.width * 0.10,
                  bottom: 0,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 25,
                        sigmaY: 25,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        height: 100,
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  petProvider.pet!.name!,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${petProvider.pet!.age!} ${petProvider.pet!.age == 1 ? 'año' : 'años'}',
                                  style: const TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  petProvider.pet!.sterillized!
                                      ? 'Estirilizado'
                                      : 'No esterilizado',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                            petProvider.pet!.sex!
                                ? Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF52B5E9),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.male,
                                        color: kTextColorContrast,
                                        size: 32,
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xFFF87C9A),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(8),
                                      ),
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.female,
                                        color: kTextColorContrast,
                                        size: 32,
                                      ),
                                    ),
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: kBackgroundColor,
                        builder: (ctx) {
                          return const FoodPetPage();
                        },
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: kPrimaryColor,
                            ),
                            color: kBackgroundColor,
                          ),
                          height: 64,
                          width: 64,
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                'assets/images/icons/pet-food.svg',
                                height: 40,
                                width: 40,
                              ),
                              const Text(
                                'Alimentos',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: () {
                      if (petProvider.pet!.specie == 0) {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: kBackgroundColor,
                          builder: (ctx) {
                            return const LitterPetPage();
                          },
                        );
                      } else {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: kBackgroundColor,
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
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: kPrimaryColor,
                            ),
                            color: kBackgroundColor,
                          ),
                          height: 64,
                          width: 64,
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                petProvider.pet!.specie! == 0
                                    ? 'assets/images/icons/cat-litter.svg'
                                    : 'assets/images/icons/leash.svg',
                                height: 40,
                                width: 40,
                              ),
                              Text(
                                petProvider.pet!.specie! == 0
                                    ? 'Arena'
                                    : 'Paseos',
                                style: const TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Column(
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         petProvider.pet!.specie! == 0
            //             ? Column(
            //                 children: [
            //                   SvgPicture.asset(
            //                     'assets/images/icons/cat.svg',
            //                     height: 42,
            //                   ),
            //                   const Text(
            //                     'Gato',
            //                     style: TextStyle(fontSize: 10),
            //                   ),
            //                 ],
            //               )
            //             : Column(
            //                 children: [
            //                   SvgPicture.asset(
            //                     'assets/images/icons/dog.svg',
            //                     height: 42,
            //                   ),
            //                   const Text(
            //                     'Perro',
            //                     style: TextStyle(fontSize: 10),
            //                   ),
            //                 ],
            //               ),
            //         const SizedBox(width: 18),
            //         petProvider.pet!.sex!
            //             ? const Column(
            //                 children: [
            //                   Icon(
            //                     Icons.male,
            //                     color: Colors.black,
            //                     size: 42,
            //                   ),
            //                   Text(
            //                     'Macho',
            //                     style: TextStyle(fontSize: 10),
            //                   ),
            //                 ],
            //               )
            //             : const Column(
            //                 children: [
            //                   Icon(
            //                     Icons.female,
            //                     color: Colors.black,
            //                     size: 42,
            //                   ),
            //                   Text(
            //                     'Hembra',
            //                     style: TextStyle(fontSize: 10),
            //                   ),
            //                 ],
            //               ),
            //         const SizedBox(width: 18),
            //         GestureDetector(
            //           onTap: () {
            //             petProvider.getAttentions(
            //               petProvider.pet!.id!,
            //               'deworming',
            //             );
            //             context.push('/petdetail/history',
            //                 extra: petProvider.pet);
            //           },
            //           child: const Column(
            //             children: [
            //               Icon(
            //                 Icons.book_outlined,
            //                 color: Colors.black,
            //                 size: 42,
            //               ),
            //               Text(
            //                 'Historial',
            //                 style: TextStyle(fontSize: 10),
            //               ),
            //             ],
            //           ),
            //         )
            //       ],
            //     ),
            //     const SizedBox(height: 12),
            //     const SizedBox(height: 24),
            //   ],
            // ),
            const Padding(
              padding: EdgeInsets.only(
                left: 16,
                top: 24,
              ),
              child: Text(
                'Servicios realizados',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Expanded(
              child: Column(
                children: [],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: SizedBox(
                  width: 192,
                  child: ButtonPrimary(
                    child: const Text('Agregar Servicio'),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: kBackgroundColor,
                        showDragHandle: true,
                        builder: (BuildContext context) {
                          int service = 0;
                          return StatefulBuilder(
                              builder: (BuildContext context, setState) {
                            return Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 64),
                                  child: Text(
                                    'Seleccionar servicio',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          service = 1;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: kPrimaryColor),
                                              color: service == 1
                                                  ? kPrimaryColor
                                                  : kBackgroundColor,
                                            ),
                                            width: 90,
                                            height: 90,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                'assets/images/icono/desparasitacion.png',
                                                color: service == 1
                                                    ? kBackgroundColor
                                                    : kPrimaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          service = 2;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: kPrimaryColor),
                                              color: service == 2
                                                  ? kPrimaryColor
                                                  : kBackgroundColor,
                                            ),
                                            width: 90,
                                            height: 90,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                'assets/images/icono/grooming.png',
                                                color: service == 2
                                                    ? kBackgroundColor
                                                    : kPrimaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          service = 3;
                                        });
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              border: Border.all(
                                                  color: kPrimaryColor),
                                              color: service == 3
                                                  ? kPrimaryColor
                                                  : kBackgroundColor,
                                            ),
                                            width: 90,
                                            height: 90,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                'assets/images/icono/vacuna.png',
                                                color: service == 3
                                                    ? kBackgroundColor
                                                    : kPrimaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 72),
                                Container(
                                  margin: const EdgeInsets.all(32),
                                  width: double.maxFinite,
                                  child: Expanded(
                                    child: ButtonPrimary(
                                      child: const Text('Continuar'),
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          backgroundColor: kBackgroundColor,
                                          showDragHandle: true,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            return Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.6,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                              child: service == 1
                                                  ? const DewormingPage()
                                                  : (service == 2)
                                                      ? const GroomingPage()
                                                      : const VaccinePage(),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            );
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
