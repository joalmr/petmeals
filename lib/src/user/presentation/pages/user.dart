import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:petmeals/config/components/widgets/button/primary_button.dart';
import 'package:petmeals/config/storage/storage.data.dart';
import 'package:petmeals/global.dart';
import 'package:petmeals/src/user/presentation/provider/user_provider.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.read<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi cuenta'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Expanded(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundImage:
                          CachedNetworkImageProvider(MyStorage().photo),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      MyStorage().name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              ButtonPrimary(
                color: mandy,
                platformApp: Global.platformApp,
                child: const Text('Cerrar sesión'),
                onPressed: () {
                  userProvider.signOut().then((value) => context.go("/"));
                },
              ),
              const SizedBox(height: 12),
              // ButtonSecondary(
              //   color: mandy,
              //   platformApp: Global.platformApp,
              //   onPressed: () {
              //     showDialog(
              //       context: context,
              //       builder: (context) {
              //         return AlertDialog(
              //           title: const Text('¿Deseas eliminar su cuenta?'),
              //           content: const Text(
              //               'Al eliminar su cuenta perderá todos los datos de forma permanente.'),
              //           actions: [
              //             TextButton(
              //               style: const ButtonStyle(
              //                   foregroundColor:
              //                       MaterialStatePropertyAll(mandy)),
              //               onPressed: () {
              //                 userProvider
              //                     .deleteUserAuth()
              //                     .then((value) => context.go("/"));
              //               },
              //               child: const Text('Eliminar'),
              //             ),
              //             TextButton(
              //               onPressed: () => context.pop(),
              //               child: const Text('Cancelar'),
              //             ),
              //           ],
              //         );
              //       },
              //     );
              //   },
              //   text: 'Eliminar cuenta',
              // ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
