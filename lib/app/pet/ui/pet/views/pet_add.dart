import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
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
    final controller3 = TextEditingController();
    final controller4 = TextEditingController();
    final controller5 = TextEditingController();

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
              const SizedBox(height: 32),
              MyTextField(
                controller: controller1,
                textField: "Name",
              ), //name
              MyTextField(
                controller: controller2,
                textField: "Borndate",
              ), //borndate
              MyTextField(
                controller: controller3,
                textField: "Specie",
              ), //specie[perro-gato]
              MyTextField(
                controller: controller4,
                textField: "Sex",
              ), //sex
              MyTextField(
                controller: controller5,
                textField: "Sterillized",
              ), //sterillized
              //user_id list
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
