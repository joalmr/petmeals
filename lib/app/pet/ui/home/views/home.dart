import 'package:comfypet/app/pet/ui/home/widgets/list_pet.home.dart';
import 'package:comfypet/app/pet/ui/home/widgets/saludo.home.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  // static Widget init() => ChangeNotifierProvider(
  //   lazy: false,
  //   create: (context) => PetProvider(
  //     petData: PetsData(),
  //     userProvider: UserProvider(userData: UserData()),
  //   ),
  //   child: const HomeView._(),
  // );

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SaludoWidget(),
            SizedBox(height: 12),
            Expanded(
              child: ListPetWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
