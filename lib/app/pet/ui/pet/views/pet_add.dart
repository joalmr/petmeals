import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/app/pet/ui/pet/widgets/sex.add.dart';
import 'package:comfypet/app/pet/ui/pet/widgets/specie.add.dart';
import 'package:comfypet/app/pet/ui/pet/widgets/sterillized.add.dart';
import 'package:comfypet/config/components/widgets/button/back.button.dart';
import 'package:comfypet/app/pet/ui/pet/widgets/picture.pet.dart';
import 'package:comfypet/config/components/widgets/button/primary.button.dart';
import 'package:comfypet/config/components/widgets/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetAddView extends StatelessWidget {
  const PetAddView({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();
    final controller1 = TextEditingController();
    final controller2 = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(
            children: [
              const PicturePet(
                buttonLeft: BackBtn(),
                aspectRatio: 3 / 4,
                child: Placeholder(),
              ),
              const SizedBox(height: 24),
              const Text(
                "Agregar mascota",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              MyTextField(
                controller: controller1,
                textField: "Nombre",
              ), //name
              MyTextField(
                controller: controller2,
                textField: "Fecha de nacimiento",
              ), //borndate
              const SizedBox(height: 4),
              const SpeciePetWidget(), //specie[perro-gato]
              const SexPetWidget(), //sex
              const SterillizedPetWidget(), //sterillized
              const SizedBox(height: 20),
              ButtonPrimary(
                child: const Text("Agregar mascota"),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
