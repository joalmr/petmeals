import 'package:get_it/get_it.dart';
import 'package:petmeals/src/pet/data/datasources/pets_data.dart';
import 'package:petmeals/src/user/data/datasources/user_data.dart';

final getIt = GetIt.instance;

setupProvidersGetIt() {
  final getItUser = getIt.registerSingleton<UserData>(UserData());
  final getItPets = getIt.registerSingleton<PetsData>(PetsData());
  // getIt.registerSingleton<UserProvider>(UserProvider(userData: getItUser));
  // getIt.registerSingleton<PetProvider>(PetProvider(petData: getItPets));
}
