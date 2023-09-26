import 'package:comfypet/app/pet/data/pets_data.dart';
import 'package:comfypet/app/pet/domain/provider/pet_provider.dart';
import 'package:comfypet/app/user/data/user_data.dart';
import 'package:comfypet/app/user/domain/provider/user_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupProviders() {
  getIt.registerSingleton<UserProvider>(UserProvider(userData: UserData()));
  getIt.registerSingleton<PetProvider>(PetProvider(petData: PetsData()));
}
