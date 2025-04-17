import 'package:flutter/material.dart';
import 'package:petmeals/src/core/styles/colors/colors.dart';
import 'package:petmeals/src/features/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/src/features/pet/presentation/views/detail/modal/attentions/deworming.dart';
import 'package:petmeals/src/features/pet/presentation/views/detail/modal/attentions/grooming.dart';
import 'package:petmeals/src/features/pet/presentation/views/detail/modal/attentions/vaccine.dart';
import 'package:provider/provider.dart';

class NextAttentions extends StatelessWidget {
  const NextAttentions({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();

    final mes = [
      'Ene',
      'Feb',
      'Mar',
      'Abr',
      'May',
      'Jun',
      'Jul',
      'Ago',
      'Sep',
      'Oct',
      'Nov',
      'Dic'
    ];

    return petProvider.nextAttentions.isEmpty
        ? const Center(
            child: Text("No hay próximas atenciones"),
          )
        : ListView.builder(
            itemCount: petProvider.nextAttentions.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemBuilder: (context, index) {
              final element = petProvider.nextAttentions[index];
              final nextdate = element.date!.add(
                Duration(days: 30 * element.nextDate!),
              );
              final inDays = nextdate.difference(DateTime.now()).inDays;

              return Container(
                margin: EdgeInsets.only(
                  bottom:
                      index == petProvider.nextAttentions.length - 1 ? 0 : 8,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                  vertical: 22,
                ),
                width: double.maxFinite,
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
                              mes[nextdate.month - 1],
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
                            backgroundColor: kContrastColor,
                            showDragHandle: true,
                            isScrollControlled: true,
                            builder: (ctx) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
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
          );
  }
}
