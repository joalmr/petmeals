import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:petmeals/config/components/styles/colors/colors.dart';
import 'package:petmeals/config/components/utils/snackbar.dart';
import 'package:provider/provider.dart';

class LeashPetPage extends StatefulWidget {
  const LeashPetPage({super.key});

  @override
  State<LeashPetPage> createState() => _LeashPetPageState();
}

class _LeashPetPageState extends State<LeashPetPage> {
  Time leashTime = Time(hour: 10, minute: 00);
  double leash = 0;

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
          leash += 1;
        }
      }
    } else {
      leash = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final petProvider = context.read<PetProvider>();

    void actionPet(PetModel myActions) {
      petProvider.actionPet(myActions).then(
        (value) {
          if (value != null) {
            context.pop();
            snackBar(
              positiveColor,
              'Horarios de paseos registrados',
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
            'Paseos',
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
                value: leash,
                max: 3,
                min: 1,
                divisions: 2,
                label: leash.toStringAsFixed(0),
                onChanged: (value) {
                  setState(() {
                    leash = value;
                  });
                },
              ),
              const SizedBox(height: 12),
              const Text('¿En qué horarios?'),
              const SizedBox(height: 12),
              Visibility(
                visible: leash == 1 || leash == 2 || leash == 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    enableInteractiveSelection: false,
                    controller: action[0],
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
                          value: leashTime,
                          onChange: (newTime) {
                            setState(() {
                              leashTime = newTime;
                              action[0].text =
                                  '${leashTime.hour > 9 ? leashTime.hour : '0${leashTime.hour}'}:${leashTime.minute == 0 ? '00' : leashTime.minute}';
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
                visible: leash == 2 || leash == 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    enableInteractiveSelection: false,
                    controller: action[1],
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
                          value: leashTime,
                          onChange: (newTime) {
                            setState(() {
                              leashTime = newTime;
                              action[1].text =
                                  '${leashTime.hour > 9 ? leashTime.hour : '0${leashTime.hour}'}:${leashTime.minute == 0 ? '00' : leashTime.minute}';
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
                visible: leash == 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: TextFormField(
                    enableInteractiveSelection: false,
                    controller: action[2],
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
                          value: leashTime,
                          onChange: (newTime) {
                            setState(() {
                              leashTime = newTime;
                              action[2].text =
                                  '${leashTime.hour > 9 ? leashTime.hour : '0${leashTime.hour}'}:${leashTime.minute == 0 ? '00' : leashTime.minute}';
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
                  switch (leash) {
                    case 1:
                      {
                        final myActions = petProvider.pet!.copyWith(
                          actions: [
                            action[0].text,
                          ],
                        );
                        actionPet(myActions);
                      }
                      break;
                    case 2:
                      {
                        final myActions = petProvider.pet!.copyWith(
                          actions: [
                            action[0].text,
                            action[1].text,
                          ],
                        );
                        actionPet(myActions);
                      }
                      break;
                    case 3:
                      {
                        final myActions = petProvider.pet!.copyWith(
                          actions: [
                            action[0].text,
                            action[1].text,
                            action[2].text,
                          ],
                        );
                        actionPet(myActions);
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
