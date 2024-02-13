import 'package:flutter/material.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:petmeals/global.dart';

class VaccinePage extends StatefulWidget {
  const VaccinePage({super.key});

  @override
  State<VaccinePage> createState() => _VaccinePageState();
}

class _VaccinePageState extends State<VaccinePage> {
  final controllerDate = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BackBtn(),
            Text(
              'Vacuna',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            MyTextField(
              textField: 'Tipo de vacuna',
              platformApp: Global.platformApp,
            ),
            MyTextField(
              textField: 'Fecha de aplicación',
              platformApp: Global.platformApp,
            ),
            MyTextField(
              textField: 'Próxima aplicación en meses(opcional)',
              platformApp: Global.platformApp,
            ),
            const SizedBox(height: 12),
            Center(
              child: ButtonPrimary(
                platformApp: Global.platformApp,
                onPressed: () {},
                child: const Text('Guardar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
