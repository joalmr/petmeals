import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:petmeals/global.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:petmeals/config/components/utils/hour_mask.dart';
import 'package:petmeals/config/components/utils/snackbar.dart';
import 'package:provider/provider.dart';
import 'package:time_parser/time_parser.dart';
// import 'package:petmeals/setup.get_it.dart';

class FoodPetPage extends StatefulWidget {
  const FoodPetPage({super.key});

  @override
  State<FoodPetPage> createState() => _FoodPetPageState();
}

class _FoodPetPageState extends State<FoodPetPage> {
  final food = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  double foods = 0;

  @override
  void initState() {
    super.initState();
    final petProvider = context.read<PetProvider>();
    if (petProvider.pet!.foods != null) {
      for (var i = 0; i < petProvider.pet!.foods!.length; i++) {
        if (petProvider.pet!.foods![i].isNotEmpty) {
          food[i].text = petProvider.pet!.foods![i];
          foods += 1;
        }
      }
    } else {
      foods = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final petProvider = context.read<PetProvider>();
    void snackBarNegative(String text) {
      snackBar(negativeColor, text, context);
    }

    void foodPet(PetModel myFoods) {
      petProvider.foodPet(myFoods).then(
            (value) => {
              if (value != null)
                {
                  snackBar(
                    positiveColor,
                    'Horarios de comida registrados',
                    context,
                  )
                }
            },
          );
    }

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BackBtn(),
            Text(
              'Alimentación',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Text('¿Cuántas veces al día?'),
            Slider(
              value: foods,
              max: 3,
              min: 1,
              divisions: 2,
              label: foods.toStringAsFixed(0),
              onChanged: (value) {
                setState(() {
                  foods = value;
                });
              },
            ),
            const SizedBox(height: 12),
            const Text('¿En qué horarios?'),
            const SizedBox(height: 12),
            Visibility(
              visible: foods == 1 || foods == 2 || foods == 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: CupertinoTextField(
                  controller: food[0],
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
              visible: foods == 2 || foods == 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: CupertinoTextField(
                  controller: food[1],
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
              visible: foods == 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: CupertinoTextField(
                  controller: food[2],
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
              onPressed: () async {
                Logger().i(petProvider.pet!.name!);
                final myFoods = petProvider.pet!.copyWith(
                  foods: [
                    food[0].text,
                    food[1].text,
                    food[2].text,
                  ],
                );

                switch (foods) {
                  case 1:
                    {
                      if (food[0].text.isEmpty) {
                        snackBarNegative('Complete el horario');
                      } else {
                        if (TimeParser.isValid(food[0].text)) {
                          foodPet(myFoods);
                        } else {
                          snackBarNegative('Hora incorrecta');
                        }
                      }
                    }
                    break;
                  case 2:
                    {
                      if (food[0].text.isEmpty || food[1].text.isEmpty) {
                        snackBarNegative('Complete el horario');
                      } else {
                        if (TimeParser.isValid(food[0].text) &&
                            TimeParser.isValid(food[1].text)) {
                          foodPet(myFoods);
                        } else {
                          snackBarNegative('Hora incorrecta');
                        }
                      }
                    }
                    break;
                  case 3:
                    {
                      if (food[0].text.isEmpty ||
                          food[1].text.isEmpty ||
                          food[2].text.isEmpty) {
                        snackBarNegative('Complete el horario');
                      } else {
                        if (TimeParser.isValid(food[0].text) &&
                            TimeParser.isValid(food[1].text) &&
                            TimeParser.isValid(food[2].text)) {
                          foodPet(myFoods);
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
    );
  }
}
