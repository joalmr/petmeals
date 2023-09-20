import 'package:comfypet/app/pet/domain/model/pet_model.dart';
import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/app/pet/ui/pet/widgets/sex.pet.dart';
import 'package:comfypet/app/pet/ui/pet/widgets/specie.pet.dart';
import 'package:comfypet/app/pet/ui/pet/widgets/sterillized.pet.dart';
import 'package:comfypet/config/components/widgets/button/back.button.dart';
import 'package:comfypet/app/pet/ui/pet/widgets/picture.pet.dart';
import 'package:comfypet/config/components/widgets/button/primary.button.dart';
import 'package:comfypet/app/pet/ui/pet/widgets/date_textfield.pet.dart';
import 'package:comfypet/config/components/widgets/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PetAddView extends StatelessWidget {
  const PetAddView({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();
    final controllerName = TextEditingController();
    final controllerDate = TextEditingController();
    // final date = DateTime.now();

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
                controller: controllerName,
                textField: "Nombre",
              ),
              DatePetWidget(
                controller: controllerDate,
                textField: "Fecha de nacimiento",
              ),
              const SizedBox(height: 4),
              const SpeciePetWidget(),
              const SexPetWidget(),
              const SterillizedPetWidget(),
              const SizedBox(height: 20),
              ButtonPrimary(
                child: const Text("Agregar mascota"),
                onPressed: () {
                  final newPet = PetModel(
                    name: controllerName.text,
                  );
                  petProvider.addPet(newPet).then(
                    (value) {
                      if (value) {
                        Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
