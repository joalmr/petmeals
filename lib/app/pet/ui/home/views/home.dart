import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/app/pet/ui/home/widgets/add_pet.home.dart';
import 'package:comfypet/app/pet/ui/home/widgets/pet.home.dart';
import 'package:comfypet/app/pet/ui/home/widgets/saludo.home.dart';
import 'package:comfypet/config/components/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    Future.microtask(() => context.read<PetProvider>().getPets());
  }

  @override
  Widget build(BuildContext context) {
    final petProvider = context.watch<PetProvider>();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SaludoWidget(),
            const SizedBox(height: 25),
            petProvider.myPets.isEmpty
                ? const Center(child: CircularProgressIndicator(color: primerColor))
                : const Expanded(
                    child: Stack(children: [
                      PetWidget(),
                      Positioned(
                        top: 12,
                        right: 12,
                        child: AddPetWidget(),
                      ),
                    ]),
                  ),
          ],
        ),
      ),
    );
  }
}
