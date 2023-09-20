import 'package:comfypet/app/pet/domain/model/pet_model.dart';
import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/app/pet/ui/home/widgets/card_pet.home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

class PetWidget extends StatelessWidget {
  const PetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: StreamBuilder<List<PetModel>>(
          stream: petProvider.loadStream(),
          builder: (context, snapshot) {
            if (!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final petData = snapshot.data!;

            if (petData.isEmpty) {
              return const Center(
                child: Text("No tiene datos"),
              );
            }
            return ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: CardSwiper(
                padding: EdgeInsets.only(bottom: petData.length > 1 ? 8 : 0),
                maxAngle: 15,
                cardsCount: petData.length,
                cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
                    CardPetWidget(pet: petData[index]),
              ),
            );
          }),
    );
  }
}
