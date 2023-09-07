import 'package:comfypet/app/ui/pages/home/widgets/mascota_home.dart';
import 'package:comfypet/app/ui/pages/home/widgets/mascotas.dart';
import 'package:comfypet/app/ui/pages/home/widgets/saludo.dart';
import 'package:flutter/material.dart';
// import 'dart:developer' as developer;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 8),
        child: const Column(
          children: [
            SaludoWidget(),
            SizedBox(height: 25),
            MascotasWidget(),
            Expanded(child: MascotaHome()),
          ],
        ),
      )),
    );
  }
}
