import 'package:flutter/material.dart';

class DdlSterillized {
  final String description;
  final bool value;
  DdlSterillized({required this.description, required this.value});
}

class Sterillized extends StatefulWidget {
  const Sterillized({super.key, required this.sterillized});
  final ValueNotifier<bool> sterillized;

  @override
  State<Sterillized> createState() => _SterillizedState();
}

class _SterillizedState extends State<Sterillized> {
  final List<DdlSterillized> list = <DdlSterillized>[
    DdlSterillized(description: 'No Esterillizado', value: false),
    DdlSterillized(description: 'Esterillizado', value: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: DropdownMenu<DdlSterillized>(
        label: const Text('Esterilizado'),
        width: MediaQuery.of(context).size.width - 20,
        initialSelection: list[widget.sterillized.value ? 1 : 0],
        onSelected: (DdlSterillized? value) {
          setState(() {
            widget.sterillized.value = value!.value;
          });
        },
        dropdownMenuEntries: list.map<DropdownMenuEntry<DdlSterillized>>(
          (DdlSterillized value) {
            return DropdownMenuEntry<DdlSterillized>(
              value: value,
              label: value.description,
            );
          },
        ).toList(),
      ),
    );
  }
}
