import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:petmeals/src/constant/global.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:petmeals/config/components/utils/snackbar.dart';
import 'package:provider/provider.dart';

class LitterPetPage extends StatefulWidget {
  const LitterPetPage({super.key});

  @override
  State<LitterPetPage> createState() => _LitterPetPageState();
}

class _LitterPetPageState extends State<LitterPetPage> {
  Time litterTime = Time(hour: 10, minute: 00);
  double litter = 0;

  final action = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

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

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BackBtn(),
            Text(
              'Limpieza de arena',
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
                  enableInteractiveSelection: false,
                  controller: action[0],
                  readOnly: true,
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      showPicker(
                        context: context,
                        value: litterTime,
                        onChange: (newTime) {
                          setState(() {
                            litterTime = newTime;
                            action[0].text =
                                '${litterTime.hour > 9 ? litterTime.hour : '0${litterTime.hour}'}:${litterTime.minute == 0 ? '00' : litterTime.minute}';
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
              visible: litter == 2 || litter == 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: CupertinoTextField(
                  enableInteractiveSelection: false,
                  controller: action[1],
                  readOnly: true,
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      showPicker(
                        context: context,
                        value: litterTime,
                        onChange: (newTime) {
                          setState(() {
                            litterTime = newTime;
                            action[1].text =
                                '${litterTime.hour > 9 ? litterTime.hour : '0${litterTime.hour}'}:${litterTime.minute == 0 ? '00' : litterTime.minute}';
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
              visible: litter == 3,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: CupertinoTextField(
                  enableInteractiveSelection: false,
                  controller: action[2],
                  readOnly: true,
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                      showPicker(
                        context: context,
                        value: litterTime,
                        onChange: (newTime) {
                          setState(() {
                            litterTime = newTime;
                            action[2].text =
                                '${litterTime.hour > 9 ? litterTime.hour : '0${litterTime.hour}'}:${litterTime.minute == 0 ? '00' : litterTime.minute}';
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
              platformApp: Global.platformApp,
              onPressed: () async {
                switch (litter) {
                  case 1:
                    {
                      final myFoods = petProvider.pet!.copyWith(
                        foods: [
                          action[0].text,
                        ],
                      );
                      actionPet(myFoods);
                    }
                    break;
                  case 2:
                    {
                      final myFoods = petProvider.pet!.copyWith(
                        foods: [
                          action[0].text,
                          action[1].text,
                        ],
                      );
                      actionPet(myFoods);
                    }
                    break;
                  case 3:
                    {
                      final myFoods = petProvider.pet!.copyWith(
                        foods: [
                          action[0].text,
                          action[1].text,
                          action[2].text,
                        ],
                      );
                      actionPet(myFoods);
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
