import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/config/storage/storage.data.dart';

class SaludoWidget extends StatelessWidget {
  const SaludoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Hola',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: .5),
                Text(
                  '${MyStorage().name} 👋',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                  margin: const EdgeInsets.all(2),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    onTap: () => context.push('/user'),
                    child: ClipRRect(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(100)),
                      child: Image(
                        image: CachedNetworkImageProvider(MyStorage().photo),
                        height: 48,
                      ),
                    ),
                  )

                  // MenuAnchor(
                  //   builder: (context, controller, child) {
                  //     return InkWell(
                  //       borderRadius:
                  //           const BorderRadius.all(Radius.circular(100)),
                  //       onTap: () {
                  //         if (controller.isOpen) {
                  //           controller.close();
                  //         } else {
                  //           controller.open();
                  //         }
                  //       },
                  //       child: ClipRRect(
                  //         borderRadius:
                  //             const BorderRadius.all(Radius.circular(100)),
                  //         child: Image(
                  //           image: CachedNetworkImageProvider(
                  //               userProvider.photoUrl!),
                  //           height: 48,
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   menuChildren: [
                  //     InkWell(
                  //       onTap: () {
                  //         userProvider.signOut().then((value) => context.go("/"));
                  //       },
                  //       child: const ListTile(
                  //         title: Text('Cerrar sesión'),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
