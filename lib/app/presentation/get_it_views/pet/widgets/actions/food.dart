import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmeals/config/components/widgets/button/primary.button.dart';

class FoodPetWidget extends StatefulWidget {
  const FoodPetWidget({super.key});

  @override
  State<FoodPetWidget> createState() => _FoodPetWidgetState();
}

class _FoodPetWidgetState extends State<FoodPetWidget> {
  double foods = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          const Text(
            'Alimentación',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text('¿Cuántas veces al día?'),
          Slider(
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
