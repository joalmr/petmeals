import 'dart:developer';
import 'package:comfypet/app/domain/pet/provider/pet_provider.dart';
import 'package:comfypet/app/views/provider/pet/widgets/date_textfield.pet.dart';
import 'package:comfypet/app/views/provider/pet/widgets/picture.pet.dart';
import 'package:comfypet/app/views/provider/pet/widgets/sex.pet.dart';
import 'package:comfypet/app/views/provider/pet/widgets/specie.pet.dart';
import 'package:comfypet/app/views/provider/pet/widgets/sterillized.pet.dart';
import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:comfypet/config/components/widgets/button/back.button.dart';
import 'package:comfypet/config/components/widgets/button/primary.button.dart';
import 'package:comfypet/config/components/widgets/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class PetAddView extends StatelessWidget {
  const PetAddView({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          children: [
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context);
                                petProvider.procesarImagen(ImageSource.camera);
                              },
                              child: const Text('Tomar foto'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context);
                                petProvider.procesarImagen(ImageSource.gallery);
                              },
                              child: const Text('Seleccionar foto'),
                            ),
                          ],
                        );
                      });
                },
                child: PicturePet(
                  buttonLeft: const BackBtn(),
                  aspectRatio: 3 / 4,
                  child: petProvider.imageFile != null
                      ? Image(
                          image: petProvider.imageFile!,
                          fit: BoxFit.cover,
                        )
                      : Container(
                          decoration: const BoxDecoration(color: primerColor),
                          height: 120,
                          child: const Center(
                            child: Icon(
                              Icons.photo,
                              size: 42,
                              color: textoColorContraste,
                            ),
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    const Text(
                      'Agregar mascota',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    MyTextField(
                      controller: petProvider.controllerName,
                      textField: 'Nombre',
                    ),
                    DatePetWidget(
                      controller: petProvider.controllerDate,
                      textField: 'Fecha de nacimiento',
                    ),
                    const SizedBox(height: 4),
                    const SpeciePetWidget(),
                    const SexPetWidget(),
                    const SterillizedPetWidget(),
                    const SizedBox(height: 20),
                    ButtonPrimary(
                      onPressed: () {
                        if (petProvider.controllerName.text.isEmpty || petProvider.imagen == null) {
                          log('error *');
                        } else {
                          petProvider.addPet().then(
                            (value) {
                              if (value) {
                                Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
                              }
                            },
                          );
                        }
                      },
                      child: const Text('Agregar mascota'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
