import 'dart:developer';
import 'package:comfypet/app/domain/pet/cubit/pet_cubit.dart';
import 'package:comfypet/app/domain/pet/model/pet_model.dart';
import 'package:comfypet/app/views/cubit/pet/widgets/date_textfield.pet.dart';
import 'package:comfypet/app/views/cubit/pet/widgets/picture.pet.dart';
import 'package:comfypet/app/views/cubit/pet/widgets/sex.pet.dart';
import 'package:comfypet/app/views/cubit/pet/widgets/specie.pet.dart';
import 'package:comfypet/app/views/cubit/pet/widgets/sterillized.pet.dart';
import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:comfypet/config/components/widgets/button/back.button.dart';
import 'package:comfypet/config/components/widgets/button/primary.button.dart';
import 'package:comfypet/config/components/widgets/textfield/textfield.dart';
import 'package:comfypet/config/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class PetAddView extends StatelessWidget {
  PetAddView({super.key});

  final controllerName = TextEditingController();
  final controllerDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetCubit>();

    return BlocConsumer<PetCubit, PetState>(
      listener: (context, state) {
        if (state is PetAdded) {
          context.read<RouterCubit>().goHome();
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog<Widget>(
                        context: context,
                        builder: (context) {
                          return SimpleDialog(
                            children: [
                              SimpleDialogOption(
                                onPressed: () {
                                  context.read<RouterCubit>().goBack();
                                  petProvider
                                      .procesarImagen(ImageSource.camera)
                                      .then(
                                        (value) =>
                                            petProvider.changeImage(value!),
                                      );
                                },
                                child: const Text('Tomar foto'),
                              ),
                              SimpleDialogOption(
                                onPressed: () {
                                  context.read<RouterCubit>().goBack();
                                  petProvider
                                      .procesarImagen(ImageSource.gallery)
                                      .then(
                                        (value) =>
                                            petProvider.changeImage(value!),
                                      );
                                },
                                child: const Text('Seleccionar foto'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: PicturePet(
                      buttonLeft: const BackBtn(),
                      aspectRatio: 3 / 4,
                      child: BlocBuilder<PetCubit, PetState>(
                        builder: (context, state) {
                          if (state is PetAddImg) {
                            return Image(
                              image: state.imageFile!,
                              fit: BoxFit.cover,
                            );
                          } else {
                            return Container(
                              decoration:
                                  const BoxDecoration(color: primerColor),
                              height: 120,
                              child: const Center(
                                child: Icon(
                                  Icons.photo,
                                  size: 42,
                                  color: textoColorContraste,
                                ),
                              ),
                            );
                          }
                        },
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
                                petProvider.state.imagen == null) {
                              log('error *');
                            } else {
                              final newPet =
                                  PetModel(name: controllerName.text);
                              petProvider.addPet(newPet);
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
      },
    );
  }
}
