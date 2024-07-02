import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:petmeals/src/core/app/styles/colors/colors.dart';
import 'package:petmeals/src/features/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/src/shared/shared.dart';
import 'package:provider/provider.dart';

class DewormingHistory extends StatelessWidget {
  const DewormingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();
    final f = DateFormat('dd-MM-yyyy');

    return petProvider.attentions.isEmpty
        ? const Center(
            child: Text('No tiene desparasitaciones registradas'),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: petProvider.attentions.length,
                  itemBuilder: (BuildContext context, int index) {
                    final nextdate =
                        petProvider.attentions[index].date!.add(Duration(
                      days: 30 * petProvider.attentions[index].nextDate!,
                    ));
                    final inDays = nextdate.difference(DateTime.now()).inDays;
                    final inMonths = inDays ~/ 30;
                    final showDate = nextdate.isAfter(DateTime.now())
                        ? 'Próximo '
                            '${inMonths > 1 ? 'en $inMonths meses' : inDays > 0 ? 'en $inDays días' : 'hoy 👀'} '
                        : index == 0
                            ? 'Vencido 👀'
                            : 'Realizado';

                    return Dismissible(
                      key: UniqueKey(),
                      background: Container(
                        color: negativeColor,
                      ),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (direction) {
                        return showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text(
                              'Eliminar',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            content: const Text(
                                'Seguro que desea eliminar la atención?'),
                            actions: [
                              ButtonAlternative(
                                text: 'Eliminar',
                                onPressed: () {
                                  petProvider.deleteAttention(
                                    petProvider.attentions[index].id!,
                                    petProvider.pet!.id!,
                                  );
                                  petProvider.notAttention(index);
                                  context.pop();
                                },
                                color: negativeColor,
                              ),
                              ButtonAlternative(
                                text: 'Cancelar',
                                onPressed: () => context.pop(),
                              ),
                            ],
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(petProvider.attentions[index].product!),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(f.format(petProvider.attentions[index].date!)),
                            Text(
                              showDate,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 0,
                        ),
                      ),
                    );
                  },
                ),
              ),
              // Container(
              //   width: double.maxFinite,
              //   decoration: const BoxDecoration(
              //     color: kPrimaryColor,
              //     borderRadius: BorderRadius.all(Radius.circular(16)),
              //   ),
              //   margin: const EdgeInsets.all(8),
              //   padding: const EdgeInsets.all(16),
              //   child: petProvider.nextDate == null
              //       ? const Text('')
              //       : Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             const Text(
              //               'Próxima desparasitación:',
              //               style: TextStyle(color: kTextColor),
              //             ),
              //             Text(
              //               petProvider.nextDate == DateTime.now()
              //                   ? 'Requiere desparasitación'
              //                   : f.format(petProvider.nextDate!),
              //               style: const TextStyle(
              //                 fontSize: 16,
              //                 fontWeight: FontWeight.bold,
              //                 color: kTextColor,
              //               ),
              //             ),
              //           ],
              //         ),
              // )
            ],
          );
  }
}
