import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  final String? idUser;
  final String? name;
  final String? photo;
  final bool? gender;

  UserModel({
    this.idUser,
    this.name,
    this.photo,
    this.gender,
  });

  UserModel copyWith({
    String? idUser,
    String? name,
    String? photo,
    bool? gender,
  }) =>
      UserModel(
        idUser: idUser ?? this.idUser,
        name: name ?? this.name,
        photo: photo ?? this.photo,
        gender: gender ?? this.gender,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        idUser: json["id_user"],
        name: json["name"],
        photo: json["photo"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "name": name,
        "photo": photo,
        "gender": gender,
      };
}
