import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/config/components/widgets/button/primary.button.dart';

class LitterPetWidget extends StatefulWidget {
  const LitterPetWidget({super.key});

  @override
  State<LitterPetWidget> createState() => _LitterPetWidgetState();
}

class _LitterPetWidgetState extends State<LitterPetWidget> {
  double litter = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const Text(
            'Cambios de arena',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
