import 'package:comfypet/app/domain/pet/cubit/pet_cubit.dart';
import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeletePetWidget extends StatelessWidget {
  const DeletePetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetCubit>();

    return CupertinoButton(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: const Icon(
          Icons.delete_forever_rounded,
          color: mandy,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('¿Deseas eliminar tu mascota?'),
                content: const Text('Al eliminar tu mascota perderás los datos de forma permanente.'),
                actions: [
                  TextButton(
                    style: const ButtonStyle(foregroundColor: MaterialStatePropertyAll(mandy)),
                    onPressed: () async {
                      petProvider.deletePet(petProvider.pet!.id!);
                    },
                    child: const Text('Eliminar'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancelar'),
                  ),
                ],
              );
            },
          );
        });
  }
}
