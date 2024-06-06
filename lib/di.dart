import 'package:get_it/get_it.dart';
import 'package:petmeals/old/pet/data/datasources/pets_data.dart';
import 'package:petmeals/old/pet/domain/usecases/pet_usecase.dart';
import 'package:petmeals/src/features/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/old/user/data/datasources/user_data.dart';
import 'package:petmeals/old/user/domain/usecases/user_usecase.dart';
import 'package:petmeals/src/features/user/presentation/providers/user_provider.dart';

final di = GetIt.instance;

Future<void> init() async {
  //Providers
  di.registerFactory(() => UserProvider(userUsecase: di<UserUsecase>()));
  di.registerFactory(() => PetProvider(petUseCase: di<PetUseCase>()));
  //Usecases
  di.registerLazySingleton(() => UserUsecase(userData: di<UserData>()));
  di.registerLazySingleton(() => PetUseCase(petData: di<PetsData>()));
  //!Repositories: debo poner repository y repositoryImpl
  //Datasources
  di.registerLazySingleton(() => UserData());
  di.registerLazySingleton(() => PetsData());
  // di.registerFactory(() => UserData());
  // di.registerFactory(() => PetsData());
}
