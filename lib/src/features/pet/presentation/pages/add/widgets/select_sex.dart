import 'package:flutter/material.dart';

class DdlSex {
  final String description;
  final bool value;
  DdlSex({required this.description, required this.value});
}

class SelectSex extends StatefulWidget {
  const SelectSex({super.key, required this.sex});
  final ValueNotifier<bool> sex;

  @override
  State<SelectSex> createState() => _SelectSexState();
}

class _SelectSexState extends State<SelectSex> {
  final List<DdlSex> list = <DdlSex>[
    DdlSex(description: 'Hembra', value: false),
    DdlSex(description: 'Macho', value: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: DropdownMenu<DdlSex>(
        label: const Text('Sexo'),
        width: MediaQuery.of(context).size.width - 20,
        initialSelection: list[widget.sex.value ? 1 : 0],
        onSelected: (DdlSex? value) {
          setState(() {
            widget.sex.value = value!.value;
          });
        },
        dropdownMenuEntries: list.map<DropdownMenuEntry<DdlSex>>(
          (DdlSex value) {
            return DropdownMenuEntry<DdlSex>(
              value: value,
              label: value.description,
            );
          },
        ).toList(),
      ),
    );
  }
}
