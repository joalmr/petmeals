// ignore_for_file: overridden_fields

part of 'pet_cubit.dart';

class PetState {
  PetState();
  String userId = MyStorage().uid;

  List<PetModel> myPets = [];
  PetModel? pet;

  int specie = 0;
  bool sex = false;
  DateTime borndate = DateTime.now();
  bool sterillized = false;
  Map<int, Specie> specieJson = {
    0: Specie(id: '0', name: 'Gato'),
    1: Specie(id: '1', name: 'Perro'),
  };

  XFile? imagen;
  FileImage? imageFile;
}

final class PetInitial extends PetState {}

final class PetSelected extends PetState {
  PetSelected(this.pet);

  @override
  final PetModel pet;
}

// final class PetLoading extends PetState {}

final class PetAddImg extends PetState {
  PetAddImg(this.imagen, this.imageFile);
  @override
  final XFile? imagen;

  @override
  final FileImage? imageFile;
}

final class PetAdded extends PetState {
  PetAdded(this.pet);

  @override
  final PetModel pet;
}

final class PetDeleted extends PetState {
  PetDeleted(this.pet);

  @override
  final PetModel pet;
}
