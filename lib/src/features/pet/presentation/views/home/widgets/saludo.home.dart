import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/src/core/app/styles/colors/colors.dart';
import 'package:petmeals/src/core/app/storage/storage.data.dart';

class SaludoWidget extends StatelessWidget {
  const SaludoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Hola, ${MyStorage().name}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                const SizedBox(height: .5),
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
                    borderRadius: const BorderRadius.all(Radius.circular(100)),
                    child: Image(
                      image: CachedNetworkImageProvider(MyStorage().photo),
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
