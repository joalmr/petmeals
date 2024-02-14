import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
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

  final dateMask = TextInputMask(
    mask: '99-99-9999',
  );

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

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
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              MyTextField(
                textField: 'Tipo de vacuna',
                platformApp: Global.platformApp,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese vacuna';
                  }
                  return null;
                },
              ),
              MyTextField(
                controller: controllerDate,
                textField: 'Fecha de vacunación',
                platformApp: Global.platformApp,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                  dateMask
                ],
                keyboardType: TextInputType.number,
                validator: (value) {
                  final date = controllerDate.text;
                  late String day;
                  late String month;
                  late String year;

                  if (value != null && date.length == 10) {
                    day = date.split('-')[0];
                    month = date.split('-')[1];
                    year = date.split('-')[2];
                  }

                  if (value == null || value.isEmpty) {
                    return 'Ingrese fecha';
                  }
                  if (date.length < 10) {
                    return 'Fecha incorrecta, complete el formato dd-mm-yyyy';
                  }
                  if (int.parse(day) > 31 || int.parse(month) > 12) {
                    return 'Fecha incorrecta, día o mes incorrecto';
                  }
                  if (date.length == 10) {
                    final dateSelected = DateTime.parse('$year-$month-$day');
                    final dateNow = DateTime.now();

                    if (dateSelected.isAfter(dateNow)) {
                      return 'Fecha incorrecta, debe ser anterior a la fecha de hoy';
                    }
                  }
                  return null;
                },
              ),
              MyTextField(
                textField: 'Próxima vacuna en meses(opcional)',
                platformApp: Global.platformApp,
              ),
              const SizedBox(height: 12),
              Center(
                child: ButtonPrimary(
                  platformApp: Global.platformApp,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Logger().i('**Correcto');
                    }
                  },
                  child: const Text('Guardar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
