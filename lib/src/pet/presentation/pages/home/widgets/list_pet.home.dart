import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/attentions/deworming.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/attentions/grooming.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/modal/attentions/vaccine.dart';
import 'package:petmeals/src/pet/presentation/pages/home/widgets/add_pet.home.dart';
import 'package:petmeals/src/pet/presentation/pages/home/widgets/card_pet.home.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
          return Center(
            child: Lottie.asset(
              'assets/loading.json',
              width: 64,
            ),
          );
        }

        final petData = snapshot.data!;

        if (petData.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonPrimary(
                onPressed: () => context.push('/add', extra: false),
                child: const Text("Agregar mascota"),
              ),
              const SizedBox(height: 32),
              const Text('No tiene mascotas'),
            ],
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (final element in petData)
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () => petProvider.myPet(element),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(100)),
                                  child: Stack(
                                    children: [
                                      element.photo == null
                                          ? Container(
                                              decoration: const BoxDecoration(
                                                  color: kPrimaryColor),
                                              height: 120,
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
                                    color: element ==
                                            context.watch<PetProvider>().pet
                                        ? kPrimaryColor
                                        : const Color(0xFFAEAEAE),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                const AddPetWidget(),
              ],
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
            ListView.builder(
              itemCount: petProvider.nextAttentions.length,
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                final element = petProvider.nextAttentions[index];
                final nextdate = element.date!.add(
                  Duration(
                    days: 30 * element.nextDate!,
                  ),
                );
                final inDays = nextdate.difference(DateTime.now()).inDays;

                return petProvider.nextAttentions.isEmpty
                    ? const Center(
                        child: Text("No hay próximas atenciones"),
                      )
                    : Container(
                        margin: EdgeInsets.only(
                          bottom: index == petProvider.nextAttentions.length - 1
                              ? 0
                              : 8,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 2,
                          vertical: 12,
                        ),
                        width: double.maxFinite,
                        height: 64,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      nextdate.day.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      nextdate.month.toString(),
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 4,
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                                width: double.maxFinite,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      element.type == 'deworming'
                                          ? 'Desparasitación'
                                          : element.type == 'grooming'
                                              ? 'Baño'
                                              : 'Vacuna',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Faltan $inDays días',
                                      style: const TextStyle(
                                        fontSize: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    backgroundColor: kBackgroundColor,
                                    showDragHandle: true,
                                    isScrollControlled: true,
                                    builder: (ctx) {
                                      return Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.6,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: element.type == 'deworming'
                                            ? const DewormingPage()
                                            : element.type == 'grooming'
                                                ? const GroomingPage()
                                                : const VaccinePage(),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
              },
            ),
          ],
        );
      },
    );
  }
}
