import 'dart:developer';
import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/app/pet/ui/pet/views/pet_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetWidget extends StatelessWidget {
  const PetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();

    return petProvider.pet == null
        ? const SizedBox()
        : Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 10,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PetDetailView(),
                  ),
                );
                log("->go to ProfilePet");
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: Image(
                      image: AssetImage(petProvider.pet!.photo!),
                      height: double.maxFinite,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 45,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          petProvider.pet!.name!,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
