import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:petmeals/global.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:petmeals/config/components/utils/hour_mask.dart';
import 'package:petmeals/config/components/utils/snackbar.dart';
import 'package:petmeals/src/pet/presentation/widgets/picture.pet.dart';
import 'package:provider/provider.dart';
import 'package:time_parser/time_parser.dart';
// import 'package:petmeals/setup.get_it.dart';

class LitterPetPage extends StatefulWidget {
  const LitterPetPage({super.key});

  @override
  State<LitterPetPage> createState() => _LitterPetPageState();
}

class _LitterPetPageState extends State<LitterPetPage> {
  final action = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  double litter = 0;

  @override
  void initState() {
    super.initState();
    final petProvider = context.read<PetProvider>();
    if (petProvider.pet!.actions != null) {
      for (var i = 0; i < petProvider.pet!.actions!.length; i++) {
        if (petProvider.pet!.actions![i].isNotEmpty) {
          action[i].text = petProvider.pet!.actions![i];
          litter += 1;
        }
      }
    } else {
      litter = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final petProvider = context.read<PetProvider>();
    void snackBarNegative(String text) {
      snackBar(negativeColor, text, context);
    }

    void actionPet(PetModel myActions) {
      petProvider.actionPet(myActions).then(
            (value) => {
              if (value != null)
                snackBar(
                  positiveColor,
                  'Horarios de limpieza de arena registrados',
                  context,
                )
            },
          );
    }

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              PicturePet(
                buttonLeft: const BackBtn(),
                aspectRatio: 3 / 4,
                child: Hero(
                  tag: 'imgpet',
                  child: Image(
                    image: CachedNetworkImageProvider(petProvider.pet!.photo!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Limpieza de arena',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              const Text('¿Cuántas veces al día?'),
              Slider(
                value: litter,
                max: 2,
                min: 1,
                divisions: 1,
                label: litter.toStringAsFixed(0),
                onChanged: (value) {
                  setState(() {
                    litter = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              const Text('¿En qué horarios?'),
              const SizedBox(height: 12),
              Visibility(
                visible: litter == 1 || litter == 2 || litter == 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: CupertinoTextField(
                    controller: action[0],
                    placeholderStyle: const TextStyle(
                      color: CupertinoColors.systemGrey,
                      fontSize: 14,
                      overflow: TextOverflow.fade,
                    ),
                    inputFormatters: [
                      hourMask,
                      LengthLimitingTextInputFormatter(5),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: litter == 2 || litter == 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: CupertinoTextField(
                    controller: action[1],
                    placeholderStyle: const TextStyle(
                      color: CupertinoColors.systemGrey,
                      fontSize: 14,
                      overflow: TextOverflow.fade,
                    ),
                    inputFormatters: [
                      hourMask,
                      LengthLimitingTextInputFormatter(5),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: litter == 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: CupertinoTextField(
                    controller: action[2],
                    placeholderStyle: const TextStyle(
                      color: CupertinoColors.systemGrey,
                      fontSize: 14,
                      overflow: TextOverflow.fade,
                    ),
                    inputFormatters: [
                      hourMask,
                      LengthLimitingTextInputFormatter(5),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ButtonPrimary(
                platformApp: Global.platformApp,
                onPressed: () {
                  final myActions = petProvider.pet!.copyWith(
                    actions: [
                      action[0].text,
                      action[1].text,
                      action[2].text,
                    ],
                  );

                  switch (litter) {
                    case 1:
                      {
                        if (action[0].text.isEmpty) {
                          snackBarNegative('Complete el horario');
                        } else {
                          if (TimeParser.isValid(action[0].text)) {
                            actionPet(myActions);
                          } else {
                            snackBarNegative('Hora incorrecta');
                          }
                        }
                      }
                      break;
                    case 2:
                      {
                        if (action[0].text.isEmpty || action[1].text.isEmpty) {
                          snackBarNegative('Complete el horario');
                        } else {
                          if (TimeParser.isValid(action[0].text) &&
                              TimeParser.isValid(action[1].text)) {
                            actionPet(myActions);
                          } else {
                            snackBarNegative('Hora incorrecta');
                          }
                        }
                      }
                      break;
                    case 3:
                      {
                        if (action[0].text.isEmpty ||
                            action[1].text.isEmpty ||
                            action[2].text.isEmpty) {
                          snackBarNegative('Complete el horario');
                        } else {
                          if (TimeParser.isValid(action[0].text) &&
                              TimeParser.isValid(action[1].text) &&
                              TimeParser.isValid(action[2].text)) {
                            actionPet(myActions);
                          } else {
                            snackBarNegative('Hora incorrecta');
                          }
                        }
                      }
                      break;
                    default:
                  }
                },
                child: const Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
