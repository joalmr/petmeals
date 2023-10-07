import 'package:comfypet/app/domain/pet/pet_provider.dart';
import 'package:comfypet/app/views/get_it/setup.get_it.dart';
import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeletePetWidget extends StatelessWidget {
  const DeletePetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = getIt<PetProvider>();

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
                content: const Text(
                    'Al eliminar tu mascota perderás los datos de forma permanente.'),
                actions: [
                  TextButton(
                    style: const ButtonStyle(
                        foregroundColor: MaterialStatePropertyAll(mandy)),
                    onPressed: () async {
                      await petProvider.deletePet(petProvider.pet!.id!);
                      if (context.mounted) {
                        context.go('/home');
                      }
                    },
                    child: const Text('Eliminar'),
                  ),
                  TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancelar'),
                  ),
                ],
              );
            },
          );
        });
  }
}
