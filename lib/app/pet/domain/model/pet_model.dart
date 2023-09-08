class PetModel {
  final String? idPet;
  final String? borndate;
  final bool? dead;
  final dynamic deadAt;
  final dynamic deletedAt;
  final String? name;
  final String? photo;
  final bool? sex;
  final bool? sterillized;
  // final Specie? specie;
  // final Timestamp? createdAt;

  PetModel({
    this.idPet,
    this.borndate,
    this.dead,
    this.deadAt,
    this.deletedAt,
    this.name,
    this.photo,
    this.sex,
    this.sterillized,
    // this.specie,
    // this.createdAt,
  });
}
