import 'package:get_it/get_it.dart';
import 'package:petmeals/src/pet/data/datasources/pets_data.dart';
import 'package:petmeals/src/pet/domain/usecases/pet_usecase.dart';
import 'package:petmeals/src/user/data/datasources/user_data.dart';

final getIt = GetIt.instance;

setupProvidersGetIt() {
  final dataUser = getIt.registerSingleton<UserData>(UserData());
  final dataPet = getIt.registerSingleton<PetsData>(PetsData());
  getIt.registerSingleton<PetUseCase>(PetUseCase(petData: dataPet));
  // getIt.registerSingleton<UserProvider>(UserProvider(userData: getItUser));
  // getIt.registerSingleton<PetProvider>(PetProvider(petData: getItPets));
}
