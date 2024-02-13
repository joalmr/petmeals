import 'package:flutter/material.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:petmeals/global.dart';

class GroomingPage extends StatefulWidget {
  const GroomingPage({super.key});

  @override
  State<GroomingPage> createState() => _GroomingPageState();
}

class _GroomingPageState extends State<GroomingPage> {
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
              'Aseo',
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
              textField: 'Tipo de aseo',
              platformApp: Global.platformApp,
            ),
            MyTextField(
              textField: 'Fecha',
              platformApp: Global.platformApp,
            ),
            MyTextField(
              textField: 'Próxima fecha en meses(opcional)',
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
