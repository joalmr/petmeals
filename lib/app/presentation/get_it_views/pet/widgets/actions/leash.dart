import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/config/components/widgets/button/primary.button.dart';

class LeashPetWidget extends StatefulWidget {
  const LeashPetWidget({super.key});

  @override
  State<LeashPetWidget> createState() => _LeashPetWidgetState();
}

class _LeashPetWidgetState extends State<LeashPetWidget> {
  double leash = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const Text(
            'Paseos',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text('¿Cuántas veces al día?'),
          Slider(
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
          const CupertinoTextField(
            placeholderStyle: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 14,
              overflow: TextOverflow.fade,
            ),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          const SizedBox(height: 2),
          const CupertinoTextField(
            placeholderStyle: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 14,
              overflow: TextOverflow.fade,
            ),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          const SizedBox(height: 2),
          const CupertinoTextField(
            placeholderStyle: TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 14,
              overflow: TextOverflow.fade,
            ),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
          const SizedBox(height: 12),
          ButtonPrimary(
            onPressed: () {},
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }
}
