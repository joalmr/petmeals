import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:provider/provider.dart';

class GroomingHistory extends StatelessWidget {
  const GroomingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();
    final f = DateFormat('dd-MM-yyyy');

    return Column(
      children: [
        if (petProvider.attentions.isEmpty)
          const Center(
            child: Text('No tiene baños registrados'),
          )
        else
          for (var i = 0; i < petProvider.attentions.length; i++)
            Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  children: [
                    Text(
                      petProvider.attentions[i].product!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(f.format(petProvider.attentions[i].date!)),
                  ],
                ),
              ),
            )
      ],
    );
  }
}
