import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petmeals/old/pet/data/models/pet_model.dart';
import 'package:petmeals/src/features/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/src/shared/shared.dart';
import 'package:petmeals/src/core/app/styles/colors/colors.dart';
import 'package:provider/provider.dart';

class FoodPetPage extends StatefulWidget {
  const FoodPetPage({super.key});

  @override
  State<FoodPetPage> createState() => _FoodPetPageState();
}

class _FoodPetPageState extends State<FoodPetPage> {
  Time foodTime = Time(hour: 10, minute: 00);
  double foods = 0;

  final food = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

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

    void foodPet(PetModel myFoods) {
      petProvider.foodPet(myFoods).then(
        (value) {
          if (value != null) {
            context.pop();
            snackBar(
              positiveColor,
              'Horarios de comida registrados',
              context,
            );
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Alimentación',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              const Text('¿Cuántas veces al día?'),
              Slider(
                activeColor: kPrimaryColor,
                inactiveColor: const Color(0xFFAEAEAE),
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
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    enableInteractiveSelection: false,
                    controller: food[0],
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            style: BorderStyle.solid, width: 1),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        showPicker(
                          context: context,
                          value: foodTime,
                          onChange: (newTime) {
                            setState(() {
                              foodTime = newTime;
                              food[0].text =
                                  '${foodTime.hour > 9 ? foodTime.hour : '0${foodTime.hour}'}:${foodTime.minute == 0 ? '00' : foodTime.minute}';
                            });
                          },
                          minuteInterval: TimePickerInterval.TEN,
                          is24HrFormat: true,
                          maxMinute: 50,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: foods == 2 || foods == 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    enableInteractiveSelection: false,
                    controller: food[1],
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            style: BorderStyle.solid, width: 1),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        showPicker(
                          context: context,
                          value: foodTime,
                          onChange: (newTime) {
                            setState(() {
                              foodTime = newTime;
                              food[1].text =
                                  '${foodTime.hour > 9 ? foodTime.hour : '0${foodTime.hour}'}:${foodTime.minute == 0 ? '00' : foodTime.minute}';
                            });
                          },
                          minuteInterval: TimePickerInterval.TEN,
                          is24HrFormat: true,
                          maxMinute: 50,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Visibility(
                visible: foods == 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    enableInteractiveSelection: false,
                    controller: food[2],
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: const BorderSide(
                            style: BorderStyle.solid, width: 1),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        showPicker(
                          context: context,
                          value: foodTime,
                          onChange: (newTime) {
                            setState(() {
                              foodTime = newTime;
                              food[2].text =
                                  '${foodTime.hour > 9 ? foodTime.hour : '0${foodTime.hour}'}:${foodTime.minute == 0 ? '00' : foodTime.minute}';
                            });
                          },
                          minuteInterval: TimePickerInterval.TEN,
                          is24HrFormat: true,
                          maxMinute: 50,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              ButtonPrimary(
                onPressed: () async {
                  switch (foods) {
                    case 1:
                      {
                        final myFoods = petProvider.pet!.copyWith(
                          foods: [
                            food[0].text,
                          ],
                        );
                        foodPet(myFoods);
                      }
                      break;
                    case 2:
                      {
                        final myFoods = petProvider.pet!.copyWith(
                          foods: [
                            food[0].text,
                            food[1].text,
                          ],
                        );
                        foodPet(myFoods);
                      }
                      break;
                    case 3:
                      {
                        final myFoods = petProvider.pet!.copyWith(
                          foods: [
                            food[0].text,
                            food[1].text,
                            food[2].text,
                          ],
                        );
                        foodPet(myFoods);
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
