import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petmeals/src/features/pet/data/models/pet_model.dart';
import 'package:petmeals/src/features/pet/domain/entities/pet.dart';
import 'package:petmeals/src/features/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/src/shared/shared.dart';
import 'package:petmeals/src/core/app/styles/colors/colors.dart';
import 'package:provider/provider.dart';

class LitterPetPage extends StatefulWidget {
  const LitterPetPage({super.key, required this.myPet});
  final ValueNotifier<PetEntity> myPet;

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

    if (widget.myPet.value.actions != null) {
      for (var i = 0; i < widget.myPet.value.actions!.length; i++) {
        if (widget.myPet.value.actions![i].isNotEmpty) {
          action[i].text = widget.myPet.value.actions![i];
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

    void actionPet(List<String> myActions) {
      final updateActions =
          PetModel.fromEntity(widget.myPet.value).copyWith(actions: myActions);
      petProvider.actionPet(updateActions).then(
        (value) {
          if (value != null) {
            widget.myPet.value = value;
            context.pop();
            snackBar(
              positiveColor,
              'Horarios de limpieza de arena registrados',
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
            'Limpieza de arena',
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
                onPressed: () async {
                  switch (litter) {
                    case 1:
                      {
                        final myActions = [
                          action[0].text,
                        ];
                        actionPet(myActions);
                      }
                      break;
                    case 2:
                      {
                        final myActions = [
                          action[0].text,
                          action[1].text,
                        ];
                        actionPet(myActions);
                      }
                      break;
                    case 3:
                      {
                        final myActions = [
                          action[0].text,
                          action[1].text,
                          action[2].text,
                        ];
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
