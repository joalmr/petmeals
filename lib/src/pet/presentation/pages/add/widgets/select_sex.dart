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
        width: 340,
        // textStyle: TextStyle(fontSize: 14),
        // inputDecorationTheme: const InputDecorationTheme(
        //   // filled: true,
        //   // fillColor: Colors.transparent,
        //   contentPadding: EdgeInsets.symmetric(
        //     horizontal: 8,
        //     vertical: 0,
        //   ),
        //   // // border: InputBorder.none,
        //   // outlineBorder: BorderSide(
        //   //   color: kPrimaryColor,
        //   //   width: 1,
        //   // ),
        // ),
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
