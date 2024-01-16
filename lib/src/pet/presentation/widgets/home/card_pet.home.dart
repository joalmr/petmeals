import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CardPetWidget extends StatelessWidget {
  const CardPetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.read<PetProvider>();
    final petWatch = context.watch<PetProvider>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => context.push('/petdetail'),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          child: Stack(
            children: [
              Image(
                image: CachedNetworkImageProvider(
                  petWatch.pet!.photo!,
                ),
                height: double.maxFinite,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: FadeIn(
                  child: Container(
                    height: 52,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                    ),
                    child: Center(
                      child: Text(
                        petProvider.pet!.name!,
                        style: const TextStyle(
                          color: kTextColorContrast,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
