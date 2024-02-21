import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:petmeals/config/components/widgets/widgets.dart';
import 'package:petmeals/global.dart';
import 'package:petmeals/src/pet/data/models/attentions_model.dart';
import 'package:petmeals/src/pet/presentation/provider/pet_provider.dart';
import 'package:provider/provider.dart';

class DewormingPage extends StatefulWidget {
  const DewormingPage({super.key});

  @override
  State<DewormingPage> createState() => _DewormingPageState();
}

class _DewormingPageState extends State<DewormingPage> {
  final controllerProduct = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerNext = TextEditingController();

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
    final petProvider = context.read<PetProvider>();

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BackBtn(),
            Text(
              'Desparasitación',
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
                controller: controllerProduct,
                textField: 'Producto aplicado',
                platformApp: Global.platformApp,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese producto';
                  }
                  return null;
                },
              ),
              MyTextField(
                controller: controllerDate,
                textField: 'Fecha de aplicación',
                platformApp: Global.platformApp,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                  dateMask
                ],
                keyboardType: TextInputType.number,
                onTap: () {
                  final f = DateFormat('dd-MM-yyyy');
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  ).then((value) {
                    controllerDate.text = value == null ? '' : f.format(value);
                  });
                },
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
                controller: controllerNext,
                textField: 'Próxima aplicación en meses',
                platformApp: Global.platformApp,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(2),
                ],
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese meses';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Center(
                child: ButtonPrimary(
                  platformApp: Global.platformApp,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      final dd = controllerDate.text.split('-')[0];
                      final mm = controllerDate.text.split('-')[1];
                      final yyyy = controllerDate.text.split('-')[2];

                      AttentionsModel attention = AttentionsModel(
                        type: 'deworming',
                        product: controllerProduct.text,
                        date: DateTime.parse('$yyyy-$mm-$dd'),
                        nextDate: controllerNext.text.isEmpty
                            ? null
                            : int.parse(controllerNext.text),
                      );
                      petProvider.addAttention(
                        attention,
                        petProvider.pet!.id!,
                      );
                      context.pop();
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
