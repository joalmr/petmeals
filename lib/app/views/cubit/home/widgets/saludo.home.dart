import 'package:cached_network_image/cached_network_image.dart';
import 'package:comfypet/app/domain/user/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaludoWidget extends StatelessWidget {
  const SaludoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserCubit>();

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
                  '${userProvider.name} 👋',
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
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: Image(
                      image: CachedNetworkImageProvider(userProvider.photoUrl!),
                      height: 48,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
