import 'package:comfypet/app/data/pet/pets_data.dart';
import 'package:comfypet/app/domain/pet/provider/pet_provider.dart';
import 'package:comfypet/app/data/user/user_data.dart';
import 'package:comfypet/app/domain/user/provider/user_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupProvidersGetIt() {
  final getItUser = getIt.registerSingleton<UserData>(UserData());
  final getItPets = getIt.registerSingleton<PetsData>(PetsData());
  getIt.registerSingleton<UserProvider>(UserProvider(userData: getItUser));
  getIt.registerSingleton<PetProvider>(PetProvider(petData: getItPets));
}
