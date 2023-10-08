import 'package:cached_network_image/cached_network_image.dart';
import 'package:comfypet/app/domain/pet/pet_provider.dart';
import 'package:comfypet/app/views/get_it/pet/widgets/delete.pet.dart';
import 'package:comfypet/app/views/get_it/pet/widgets/picture.pet.dart';
import 'package:comfypet/app/views/get_it/setup.get_it.dart';
import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:comfypet/config/components/widgets/button/back.button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PetDetailView extends StatelessWidget {
  const PetDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = getIt<PetProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            PicturePet(
              buttonLeft: const BackBtn(),
              buttonRight: const DeletePetWidget(),
              aspectRatio: 3 / 4,
              child: Hero(
                tag: 'imgpet',
                child: Image(
                  image: CachedNetworkImageProvider(petProvider.pet!.photo!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              petProvider.pet!.name!,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${petProvider.pet!.age!} ${petProvider.pet!.age == 1 ? 'año' : 'años'}',
              style: const TextStyle(
                  color: primerColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                petProvider.pet!.specie!.id! == '0'
                    ? Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/cat.svg',
                            height: 42,
                          ),
                          const Text(
                            'Gato',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/dog.svg',
                            height: 42,
                          ),
                          const Text(
                            'Perro',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                const SizedBox(width: 24),
                petProvider.pet!.sex!
                    ? const Column(
                        children: [
                          Icon(Icons.male, size: 42),
                          Text(
                            'Macho',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      )
                    : const Column(
                        children: [
                          Icon(Icons.female, size: 42),
                          Text(
                            'Hebra',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              petProvider.pet!.sterillized!
                  ? 'Estirilizado'
                  : 'No esterilizado',
            )
          ],
        ),
      ),
    );
  }
}
