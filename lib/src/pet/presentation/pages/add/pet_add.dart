import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:petmeals/ads_view.dart';
import 'package:petmeals/config/components/utils/snackbar.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:petmeals/src/constant/global.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petmeals/src/pet/presentation/widgets/picture.pet.dart';
import 'package:petmeals/src/pet/presentation/widgets/sex.pet.dart';
import 'package:petmeals/src/pet/presentation/widgets/specie.pet.dart';
import 'package:petmeals/src/pet/presentation/widgets/sterillized.pet.dart';
import 'package:provider/provider.dart';

DateFormat format() {
  return DateFormat('dd-MM-yyyy');
}

class PetAddPage extends StatefulWidget {
  const PetAddPage({super.key, this.petUpd});
  final PetModel? petUpd;

  @override
  State<PetAddPage> createState() => _PetAddPageState();
}

class _PetAddPageState extends State<PetAddPage> {
  final controllerName = TextEditingController();
  final controllerDate = TextEditingController();

  int specie = 0; //
  bool sex = false;
  DateTime borndate = DateTime.now();
  bool sterillized = false;

  bool loading = false;

  @override
  void initState() {
    super.initState();
    final petProvider = context.read<PetProvider>();

    if (widget.petUpd != null) {
      controllerName.text = widget.petUpd!.name!;
      controllerDate.text = format().format(widget.petUpd!.borndate!);

      petProvider.pet = widget.petUpd; //**
      borndate = widget.petUpd!.borndate!;
      specie = widget.petUpd!.specie!;
      sex = widget.petUpd!.sex!;
      sterillized = widget.petUpd!.sterillized!;
    } else {
      if (controllerDate.text.isEmpty) {
        controllerDate.text = format().format(DateTime.now());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final petProvider = context.read<PetProvider>();
    final petWatch = context.watch<PetProvider>();

    final formKey = GlobalKey<FormState>();

    return AdsView(
      child: Scaffold(
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
                                        petProvider.procesarImagen(
                                            ImageSource.gallery);
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
                                          color: Colors.white,
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
                        child: Form(
                          key: formKey,
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
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Ingrese nombre';
                                  }
                                  return null;
                                },
                              ),
                              MyTextField(
                                controller: controllerDate,
                                textField: 'Fecha de nacimiento',
                                platformApp: Global.platformApp,
                                readOnly: true,
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime.now(),
                                  ).then((value) {
                                    if (value != null) {
                                      controllerDate.text =
                                          format().format(value);
                                      borndate = value;
                                    }
                                  });
                                },
                              ),
                              const SizedBox(height: 4),
                              //*  */
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Especie',
                                      style: TextStyle(color: kTextColor),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SpeciePetWidget(
                                          active: specie == 0 ? true : false,
                                          specie: 0,
                                          onPressed: () {
                                            setState(() {
                                              specie = 0;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 20),
                                        SpeciePetWidget(
                                          active: specie == 1 ? true : false,
                                          specie: 1,
                                          onPressed: () {
                                            setState(() {
                                              specie = 1;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Sexo',
                                      style: TextStyle(color: kTextColor),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SexPetWidget(
                                          sex: false,
                                          active: sex == false ? true : false,
                                          onPressed: () {
                                            setState(() {
                                              sex = false;
                                            });
                                          },
                                        ),
                                        const SizedBox(width: 20),
                                        SexPetWidget(
                                          sex: true,
                                          active: sex == true ? true : false,
                                          onPressed: () {
                                            setState(() {
                                              sex = true;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SterillizedPetWidget(
                                sterillized: sterillized,
                                onChanged: (value) {
                                  setState(() {
                                    sterillized = value;
                                  });
                                },
                              ),
                              //*  */
                              const SizedBox(height: 20),
                              ButtonPrimary(
                                platformApp: Global.platformApp,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    setState(() => loading = true);
                                    if (widget.petUpd == null) {
                                      if (petProvider.imageFile == null) {
                                        snackBar(
                                          negativeColor,
                                          'Agregue imagen',
                                          context,
                                        );
                                        setState(() => loading = false);
                                      } else {
                                        var newPet = PetModel(
                                          name: controllerName.text,
                                          borndate: borndate,
                                          specie: specie,
                                          sex: sex,
                                          sterillized: sterillized,
                                          userId: [petProvider.userId],
                                        );
                                        petProvider.addPet(newPet).then(
                                          (value) {
                                            context.go('/home');
                                          },
                                        );
                                      }
                                    } else {
                                      var updatePet = petProvider.pet!.copyWith(
                                        name: controllerName.text,
                                        borndate: borndate,
                                        specie: specie,
                                        sex: sex,
                                        sterillized: sterillized,
                                        userId: [petProvider.userId],
                                      );
                                      petProvider.updatePet(updatePet).then(
                                        (value) {
                                          if (value != null) {
                                            context.go('/home');
                                          }
                                        },
                                      );
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
                                      padding: const EdgeInsets.only(
                                          top: 18, bottom: 24),
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
                                                          .deletePet(widget
                                                              .petUpd!.id!)
                                                          .then(
                                                            (value) => context
                                                                .go('/home'),
                                                          );
                                                    },
                                                    child:
                                                        const Text('Eliminar'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () =>
                                                        context.pop(),
                                                    child:
                                                        const Text('Cancelar'),
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
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
