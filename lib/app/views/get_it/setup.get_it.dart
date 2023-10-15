import 'package:petmeals/app/data/pet/pets_data.dart';
import 'package:petmeals/app/domain/pet/pet_provider.dart';
import 'package:petmeals/app/data/user/user_data.dart';
import 'package:petmeals/app/domain/user/user_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setupProvidersGetIt() {
  final getItUser = getIt.registerSingleton<UserData>(UserData());
  final getItPets = getIt.registerSingleton<PetsData>(PetsData());
  getIt.registerSingleton<UserProvider>(UserProvider(userData: getItUser));
  getIt.registerSingleton<PetProvider>(PetProvider(petData: getItPets));
}
