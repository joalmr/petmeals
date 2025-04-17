import 'package:cached_network_image/cached_network_image.dart';
import 'package:petmeals/src/core/styles/colors/colors.dart';
import 'package:petmeals/src/features/pet/presentation/provider/pet_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CardPetWidget extends StatelessWidget {
  const CardPetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final petWatch = context.watch<PetProvider>();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () => context.push('/petdetail', extra: petWatch.pet),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: petWatch.pet?.photo == null
                    ? Container(
                        decoration: const BoxDecoration(color: kPrimaryColor),
                        height: double.maxFinite,
                        child: const Center(
                          child: Icon(
                            Icons.photo,
                            size: 42,
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Image(
                        image: CachedNetworkImageProvider(
                          petWatch.pet!.photo!,
                        ),
                        height: double.maxFinite,
                        fit: BoxFit.cover,
                      ),
              ),
              Positioned(
                bottom: 12,
                right: 12,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100)),
                  child: Container(
                    height: 52,
                    width: 52,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: kPrimaryColor,
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward_rounded,
                        size: 32,
                        color: kTextColorContrast,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
