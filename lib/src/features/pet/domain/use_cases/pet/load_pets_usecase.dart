import 'package:petmeals/src/features/pet/domain/entities/pet.dart';
import 'package:petmeals/src/features/pet/domain/repositories/pet_repository.dart';

class LoadPetsUsecase {
  final PetRepository repository;

  LoadPetsUsecase({required this.repository});

  Stream<List<PetEntity>> call(String userId) {
    return repository.loadPets(userId);
  }
}
