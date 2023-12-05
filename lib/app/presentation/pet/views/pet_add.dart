import 'package:cached_network_image/cached_network_image.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/app/data/pet/models/pet_model.dart';
import 'package:petmeals/app/domain/pet/pet_provider.dart';
import 'package:petmeals/app/presentation/pet/widgets/date_textfield.pet.dart';
import 'package:petmeals/app/presentation/pet/widgets/picture.pet.dart';
import 'package:petmeals/app/presentation/pet/widgets/sex.pet.dart';
import 'package:petmeals/app/presentation/pet/widgets/specie.pet.dart';
import 'package:petmeals/app/presentation/pet/widgets/sterillized.pet.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:petmeals/global.dart';
import 'package:petmeals/setup.get_it.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:watch_it/watch_it.dart';

class PetAddView extends WatchingStatefulWidget {
  const PetAddView({super.key, this.petUpd});
  final PetModel? petUpd;

  @override
  State<PetAddView> createState() => _PetAddViewState();
}

class _PetAddViewState extends State<PetAddView> {
  final controllerName = TextEditingController();
  final controllerDate = TextEditingController();

  final petProvider = getIt<PetProvider>();
  @override
  void initState() {
    super.initState();

    if (widget.petUpd != null) {
      Logger().d(widget.petUpd);
      controllerName.text = widget.petUpd!.name!;
      controllerDate.text = format().format(widget.petUpd!.borndate!);

      petProvider.pet = widget.petUpd;
      petProvider.borndate = widget.petUpd!.borndate!;
      petProvider.specie = int.parse(widget.petUpd!.specie!.id!);
      petProvider.sex = widget.petUpd!.sex!;
      petProvider.sterillized = widget.petUpd!.sterillized!;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  child: watch(petProvider).imageFile != null
                      ? Image(
                          image: petProvider.imageFile!, //?
                          fit: BoxFit.cover,
                        )
                      : widget.petUpd == null
                          ? Container(
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
                            )
                          : CachedNetworkImage(
                              imageUrl: widget.petUpd!.photo!,
                              fit: BoxFit.cover,
                            ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  children: [
                    Text(
                      widget.petUpd == null
                          ? 'Agregar mascota'
                          : 'Modificar mascota',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    MyTextField(
                      controller: controllerName,
                      textField: 'Nombre',
                      platformApp: Global.platformApp,
                    ),
                    DatePetWidget(
                      controller: controllerDate,
                      textField: 'Fecha de nacimiento',
                    ),
                    const SizedBox(height: 4),
                    const SpeciePetWidget(
                        //? specie
                        ),
                    const SexPetWidget(
                        //? sex
                        ),
                    const SterillizedPetWidget(
                        //? sterillized
                        ),
                    const SizedBox(height: 20),
                    ButtonPrimary(
                      platformApp: Global.platformApp,
                      onPressed: () {
                        if (controllerName.text.isEmpty) {
                          Logger().i('Falta nombre');
                        }

                        if (widget.petUpd == null) {
                          if (petProvider.imageFile == null) {
                            Logger().i('Falta imagen');
                          }
                          PetModel newPet = PetModel(name: controllerName.text);
                          petProvider.addPet(newPet).then(
                            (value) {
                              if (value) {
                                context.go('/home');
                              }
                            },
                          );
                        } else {
                          var updatePet = petProvider.pet!.copyWith(
                            name: controllerName.text,
                          );
                          petProvider.updatePet(updatePet).then(
                            (value) {
                              if (value != null) {
                                context.go('/home');
                              }
                            },
                          );
                        }
                      },
                      child: Text(widget.petUpd != null
                          ? 'Guardar'
                          : 'Agregar mascota'),
                    ),
                    widget.petUpd == null
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(top: 32),
                            child: ButtonSecondary(
                              text: 'Eliminar mascota',
                              color: Colors.red,
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                          '¿Deseas eliminar tu mascota?'),
                                      content: const Text(
                                          'Al eliminar tu mascota perderás los datos de forma permanente.'),
                                      actions: [
                                        TextButton(
                                          style: const ButtonStyle(
                                              foregroundColor:
                                                  MaterialStatePropertyAll(
                                                      mandy)),
                                          onPressed: () {
                                            petProvider
                                                .deletePet(widget.petUpd!.id!)
                                                .then((value) =>
                                                    context.go('/home'));
                                          },
                                          child: const Text('Eliminar'),
                                        ),
                                        TextButton(
                                          onPressed: () => context.pop(),
                                          child: const Text('Cancelar'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              platformApp: Global.platformApp,
                            ),
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
