import 'package:get_it/get_it.dart';
import 'package:petmeals/old/pet/data/datasources/pets_data.dart';
import 'package:petmeals/old/pet/domain/usecases/pet_usecase.dart';
import 'package:petmeals/src/features/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/src/features/user/data/datasources/person_auth_remote.dart';
import 'package:petmeals/src/features/user/data/repositories/person_auth_repository_impl.dart';
import 'package:petmeals/src/features/user/domain/repositories/person_auth_repository.dart';
import 'package:petmeals/src/features/user/domain/use_cases/signin_person_auth_usecase.dart';
import 'package:petmeals/src/features/user/domain/use_cases/signout_person_auth_usecase.dart';
import 'package:petmeals/src/features/user/presentation/providers/user_provider.dart';

final di = GetIt.instance;

Future<void> init() async {
  //Providers
  di.registerFactory(() => UserProvider(
        signInUsecase: di(),
        signOutUsecase: di(),
      ));
  di.registerFactory(() => PetProvider(petUseCase: di<PetUseCase>()));
  //Usecases
  // di.registerLazySingleton(() => UserUsecase(userData: di<UserData>()));
  di.registerLazySingleton(() => SigninPersonAuthUsecase(repository: di()));
  di.registerLazySingleton(() => SignoutPersonAuthUsecase(repository: di()));
  //??
  di.registerLazySingleton(() => PetUseCase(petData: di<PetsData>()));
  //!Repositories: debo poner repository y repositoryImpl
  di.registerLazySingleton<PersonAuthRepository>(() => PersonAuthRepositoryImpl(
        remoteDataSource: di(),
      ));
  //Datasources
  di.registerLazySingleton<PersonAuthRemoteDataSource>(
      () => PersonAuthRemoteDataSourceImpl());
  di.registerLazySingleton(() => PetsData());
}
