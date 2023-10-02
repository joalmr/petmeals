import 'package:cached_network_image/cached_network_image.dart';
import 'package:comfypet/app/domain/pet/pet_provider.dart';
import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPetWidget extends StatelessWidget {
  const CardPetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, 'petdetail'),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Stack(
            children: [
              Image(
                image: CachedNetworkImageProvider(petProvider.pet!.photo!),
                height: double.maxFinite,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
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
                        color: textoColorContraste,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
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
