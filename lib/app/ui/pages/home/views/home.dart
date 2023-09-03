import 'package:comfypet/app/ui/pages/home/widgets/mascota_select.dart';
import 'package:comfypet/app/ui/pages/home/widgets/mascotas.dart';
import 'package:comfypet/app/ui/pages/home/widgets/saludo.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
          child: const Column(
            children: [
              SaludoHome(), //titulo
              SizedBox(height: 25),
              MascotasHome(), //lista de mascotas
              Expanded(
                child: MascotaSelectHome(), //mascota seleccionada
              ),
            ],
          ),
        ),
      ),
    );
  }
}
