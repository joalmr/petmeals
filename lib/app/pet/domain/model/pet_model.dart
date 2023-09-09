import 'dart:convert';

List<PetModel> petModelFromJson(String str) =>
    List<PetModel>.from(json.decode(str).map((x) => PetModel.fromJson(x)));

String petModelToJson(List<PetModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PetModel {
  final String? idPet;
  final String? name;
  final String? photo;
  final bool? sex;
  final DateTime? borndate;

  PetModel({
    this.idPet,
    this.name,
    this.photo,
    this.sex,
    this.borndate,
  });

  PetModel copyWith({
    String? idPet,
    String? name,
    String? photo,
    bool? sex,
    DateTime? borndate,
  }) =>
      PetModel(
        idPet: idPet ?? this.idPet,
        name: name ?? this.name,
        photo: photo ?? this.photo,
        sex: sex ?? this.sex,
        borndate: borndate ?? this.borndate,
      );

  factory PetModel.fromJson(Map<String, dynamic> json) => PetModel(
        idPet: json["id_pet"],
        name: json["name"],
        photo: json["photo"],
        sex: json["sex"],
        borndate: DateTime.parse(json["borndate"]),
      );

  Map<String, dynamic> toJson() => {
        "id_pet": idPet,
        "name": name,
        "photo": photo,
        "sex": sex,
        "borndate":
            "${borndate!.year.toString().padLeft(4, '0')}-${borndate!.month.toString().padLeft(2, '0')}-${borndate!.day.toString().padLeft(2, '0')}",
      };
}
