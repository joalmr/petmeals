import 'package:petmeals/src/features/pet/domain/entities/pet.dart';
import 'package:petmeals/src/features/pet/domain/repositories/pet_repository.dart';

class GetPetsUsecase {
  final PetRepository repository;

  GetPetsUsecase({required this.repository});

  Future<List<PetEntity>> call(String userId) {
    return repository.getPets(userId);
  }
}
