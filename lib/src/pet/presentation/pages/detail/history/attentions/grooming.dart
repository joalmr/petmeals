import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:petmeals/config/components/widgets/button/secondary_button.dart';
import 'package:petmeals/global.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:provider/provider.dart';

class GroomingHistory extends StatelessWidget {
  const GroomingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();
    final f = DateFormat('dd-MM-yyyy');

    return petProvider.attentions.isEmpty
        ? const Center(
            child: Text('No tiene baños registrados'),
          )
        : ListView.builder(
            itemCount: petProvider.attentions.length,
            itemBuilder: (BuildContext context, int index) {
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
                      content:
                          const Text('Seguro que desea eliminar la atención?'),
                      actions: [
                        ButtonSecondary(
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
                          platformApp: Global.platformApp,
                        ),
                        ButtonSecondary(
                          text: 'Cancelar',
                          onPressed: () => context.pop(),
                          platformApp: Global.platformApp,
                        ),
                      ],
                    ),
                  );
                },
                child: ListTile(
                  title: Text(petProvider.attentions[index].product!),
                  subtitle: Text(f.format(petProvider.attentions[index].date!)),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          );
  }
}
