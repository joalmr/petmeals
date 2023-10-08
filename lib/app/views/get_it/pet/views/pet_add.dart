import 'dart:developer';
import 'package:comfypet/app/domain/pet/model/pet_model.dart';
import 'package:comfypet/app/domain/pet/pet_provider.dart';
import 'package:comfypet/app/views/get_it/pet/widgets/date_textfield.pet.dart';
import 'package:comfypet/app/views/get_it/pet/widgets/picture.pet.dart';
import 'package:comfypet/app/views/get_it/pet/widgets/sex.pet.dart';
import 'package:comfypet/app/views/get_it/pet/widgets/specie.pet.dart';
import 'package:comfypet/app/views/get_it/pet/widgets/sterillized.pet.dart';
import 'package:comfypet/app/views/get_it/setup.get_it.dart';
import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:comfypet/config/components/widgets/button/back.button.dart';
import 'package:comfypet/config/components/widgets/button/primary.button.dart';
import 'package:comfypet/config/components/widgets/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:get_it_mixin/get_it_mixin.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class PetAddView extends StatelessWidget with GetItMixin {
  PetAddView({super.key});

  final controllerName = TextEditingController();
  final controllerDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final petProvider = getIt<PetProvider>();

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
                                context.pop();
                                petProvider.procesarImagen(ImageSource.camera);
                              },
                              child: const Text('Tomar foto'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                context.pop();
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
                  child: watchOnly((PetProvider p) => p.imageFile) != null
                      ? Image(
                          image: watchOnly((PetProvider p) => p.imageFile!),
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
                      controller: controllerName,
                      textField: 'Nombre',
                    ),
                    DatePetWidget(
                      controller: controllerDate,
                      textField: 'Fecha de nacimiento',
                    ),
                    const SizedBox(height: 4),
                    const SpeciePetWidget(),
                    const SexPetWidget(),
                    const SterillizedPetWidget(),
                    const SizedBox(height: 20),
                    ButtonPrimary(
                      onPressed: () {
                        if (controllerName.text.isEmpty ||
                            petProvider.imageFile == null) {
                          log('error *');
                        } else {
                          PetModel newPet = PetModel(name: controllerName.text);
                          petProvider.addPet(newPet).then(
                            (value) {
                              if (value) {
                                context.push('/home');
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
