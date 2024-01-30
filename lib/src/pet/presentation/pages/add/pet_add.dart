import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:petmeals/config/components/utils/snackbar.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:petmeals/global.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmeals/src/pet/presentation/widgets/date_textfield.pet.dart';
import 'package:petmeals/src/pet/presentation/widgets/picture.pet.dart';
import 'package:petmeals/src/pet/presentation/widgets/sex.pet.dart';
import 'package:petmeals/src/pet/presentation/widgets/specie.pet.dart';
import 'package:petmeals/src/pet/presentation/widgets/sterillized.pet.dart';
import 'package:provider/provider.dart';

class PetAddPage extends StatefulWidget {
  const PetAddPage({super.key, this.petUpd});
  final PetModel? petUpd;

  @override
  State<PetAddPage> createState() => _PetAddPageState();
}

class _PetAddPageState extends State<PetAddPage> {
  final controllerName = TextEditingController();
  final controllerDate = TextEditingController();

  @override
  void initState() {
    super.initState();
    final petProvider = context.read<PetProvider>();
    if (widget.petUpd != null) {
      controllerName.text = widget.petUpd!.name!;
      controllerDate.text = format().format(widget.petUpd!.borndate!);

      petProvider.pet = widget.petUpd;
      petProvider.borndate = widget.petUpd!.borndate!;
      petProvider.specie = widget.petUpd!.specie!;
      petProvider.sex = widget.petUpd!.sex!;
      petProvider.sterillized = widget.petUpd!.sterillized!;
    }
  }

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final petProvider = context.read<PetProvider>();
    final petWatch = context.watch<PetProvider>();

    return Scaffold(
      body: SafeArea(
        child: loading
            ? Center(
                child: Lottie.asset(
                  'assets/loading.json',
                  width: 64,
                ),
              )
            : SingleChildScrollView(
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
                                      petProvider
                                          .procesarImagen(ImageSource.camera);
                                    },
                                    child: const Text('Tomar foto'),
                                  ),
                                  SimpleDialogOption(
                                    onPressed: () {
                                      context.pop();
                                      petProvider
                                          .procesarImagen(ImageSource.gallery);
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
                        child: petWatch.imageFile != null
                            ? Image(
                                image: petProvider.imageFile!, //?
                                fit: BoxFit.cover,
                              )
                            : widget.petUpd == null
                                ? Container(
                                    decoration: const BoxDecoration(
                                        color: kPrimaryColor),
                                    height: 120,
                                    child: const Center(
                                      child: Icon(
                                        Icons.photo,
                                        size: 42,
                                        color: kTextColorContrast,
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
                          const SpeciePetWidget(), //? specie
                          const SexPetWidget(), //? sex
                          const SterillizedPetWidget(), //? sterillized
                          const SizedBox(height: 20),
                          ButtonPrimary(
                            platformApp: Global.platformApp,
                            onPressed: () {
                              setState(() => loading = true);
                              if (controllerName.text.isEmpty ||
                                  petProvider.imageFile == null) {
                                if (controllerName.text.isEmpty) {
                                  snackBar(
                                    negativeColor,
                                    'Ingrese nombre',
                                    context,
                                  );
                                } else {
                                  snackBar(
                                    negativeColor,
                                    'Agregue imagen',
                                    context,
                                  );
                                }
                                setState(() => loading = false);
                              } else {
                                if (widget.petUpd == null) {
                                  PetModel newPet =
                                      PetModel(name: controllerName.text);
                                  petProvider.addPet(newPet).then((value) {
                                    context.go('/home');
                                  });
                                } else {
                                  var updatePet = petProvider.pet!.copyWith(
                                    name: controllerName.text,
                                  );
                                  petProvider
                                      .updatePet(updatePet)
                                      .then((value) {
                                    if (value != null) {
                                      context.go('/home');
                                    }
                                  });
                                }
                              }
                            },
                            child: Text(widget.petUpd != null
                                ? 'Guardar'
                                : 'Agregar mascota'),
                          ),
                          widget.petUpd == null
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.only(top: 24),
                                  child: ButtonSecondary(
                                    text: 'Eliminar mascota',
                                    color: mandy,
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
                                                  setState(
                                                      () => loading = true);
                                                  petProvider
                                                      .deletePet(
                                                          widget.petUpd!.id!)
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
