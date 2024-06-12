import 'package:flutter/material.dart';

class DdlSpecie {
  final String description;
  final int value;
  DdlSpecie({required this.description, required this.value});
}

class SelectSpecie extends StatefulWidget {
  const SelectSpecie({super.key, required this.specie});
  final ValueNotifier<int> specie;

  @override
  State<SelectSpecie> createState() => _SelectSpecieState();
}

class _SelectSpecieState extends State<SelectSpecie> {
  final List<DdlSpecie> list = <DdlSpecie>[
    DdlSpecie(description: 'Gato', value: 0),
    DdlSpecie(description: 'Perro', value: 1),
    DdlSpecie(description: 'Otro', value: 2),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: DropdownMenu<DdlSpecie>(
        label: const Text('Especie'),
        width: MediaQuery.of(context).size.width - 20,
        initialSelection: list[widget.specie.value],
        onSelected: (DdlSpecie? value) {
          setState(() {
            widget.specie.value = value!.value;
          });
        },
        dropdownMenuEntries: list.map<DropdownMenuEntry<DdlSpecie>>(
          (DdlSpecie value) {
            return DropdownMenuEntry<DdlSpecie>(
              value: value,
              label: value.description,
            );
          },
        ).toList(),
      ),
    );
  }
}
