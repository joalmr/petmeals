import 'package:petmeals/src/features/pet/domain/repositories/pet_repository.dart';

class DeletePetUsecase {
  final PetRepository repository;

  DeletePetUsecase({required this.repository});

  Future<void> call(String petId) {
    return repository.deletePet(petId);
  }
}
