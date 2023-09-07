class PetModelTest {
  PetModelTest({
    this.idPet,
    this.borndate,
    // this.specie,
    // this.createdAt,
    this.dead,
    this.deadAt,
    this.deletedAt,
    this.name,
    this.photo,
    this.sex,
    this.sterillized,
  });

  final String? idPet;
  final String? borndate;
  // final Specie? specie;
  // final Timestamp? createdAt;
  final bool? dead;
  final dynamic deadAt;
  final dynamic deletedAt;
  final String? name;
  final String? photo;
  final bool? sex;
  final bool? sterillized;
}
