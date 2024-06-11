import 'package:get_it/get_it.dart';
import 'package:petmeals/src/features/pet/data/datasources/attention_remote.dart';
import 'package:petmeals/src/features/pet/data/datasources/pet_remote.dart';
import 'package:petmeals/src/features/pet/data/repositories/attention_repository_impl.dart';
import 'package:petmeals/src/features/pet/data/repositories/pet_repository_impl.dart';
import 'package:petmeals/src/features/pet/domain/repositories/attention_repository.dart';
import 'package:petmeals/src/features/pet/domain/repositories/pet_repository.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/attention/add_attention_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/attention/delete_attention_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/attention/get_attentions_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/attention/get_next_attentions_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/pet/add_pet_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/pet/delete_pet_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/pet/get_pets_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/pet/load_pets_usecase.dart';
import 'package:petmeals/src/features/pet/domain/use_cases/pet/update_pet_usecase.dart';
import 'package:petmeals/src/features/pet/presentation/provider/pet_provider.dart';
import 'package:petmeals/src/features/user/data/datasources/person_auth_remote.dart';
import 'package:petmeals/src/features/user/data/repositories/person_auth_repository_impl.dart';
import 'package:petmeals/src/features/user/domain/repositories/person_auth_repository.dart';
import 'package:petmeals/src/features/user/domain/use_cases/signin_person_auth_usecase.dart';
import 'package:petmeals/src/features/user/domain/use_cases/signout_person_auth_usecase.dart';
import 'package:petmeals/src/features/user/presentation/providers/user_provider.dart';

final di = GetIt.instance;

Future<void> init() async {
  //?Providers
  di.registerFactory(() => UserProvider(
        di(),
        di(),
      ));
  di.registerFactory(() => PetProvider(
        di(),
        di(),
        di(),
        di(),
        di(), //fin pet
        di(),
        di(),
        di(),
        di(), //fin attentio
      ));
  //?Usecases
  di.registerLazySingleton(() => SigninPersonAuthUsecase(repository: di()));
  di.registerLazySingleton(() => SignoutPersonAuthUsecase(repository: di()));
  //pet
  di.registerLazySingleton(() => AddPetUsecase(repository: di()));
  di.registerLazySingleton(() => DeletePetUsecase(repository: di()));
  di.registerLazySingleton(() => GetPetsUsecase(repository: di()));
  di.registerLazySingleton(() => LoadPetsUsecase(repository: di()));
  di.registerLazySingleton(() => UpdatePetUsecase(repository: di()));
  //attention
  di.registerLazySingleton(() => AddAttentionUseCase(repository: di()));
  di.registerLazySingleton(() => DeleteAttentionUsecase(repository: di()));
  di.registerLazySingleton(() => GetAttentionsUsecase(repository: di()));
  di.registerLazySingleton(() => GetNextAttentionsUsecase(repository: di()));
  //??Repositories: repository y repositoryImpl
  //PersonAuthRepository
  di.registerLazySingleton<PersonAuthRepository>(() => PersonAuthRepositoryImpl(
        remoteDataSource: di(),
      ));
  // PetRepository & AttentionRepository
  di.registerLazySingleton<PetRepository>(() => PetRepositoryImpl(
        remoteDataSource: di(),
      ));

  di.registerLazySingleton<AttentionRepository>(() => AttentionRepositoryImpl(
        remoteDataSource: di(),
      ));
  //?Datasources
  //PersonAuth
  di.registerLazySingleton<PersonAuthRemoteDataSource>(
      () => PersonAuthRemoteDataSourceImpl());
  //Pet & Attention
  di.registerLazySingleton<PetRemoteDataSource>(
      () => PetRemoteDataSourceImpl());
  di.registerLazySingleton<AttentionRemoteDataSource>(
      () => AttentionRemoteDataSourceImpl());
}
