import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  final String? id;
  final int? gender;
  final String? name;
  final String? photo;
  final String? email;
  final String? lastname;

  UserModel({
    this.id,
    this.gender,
    this.name,
    this.photo,
    this.email,
    this.lastname,
  });

  UserModel copyWith({
    String? id,
    int? gender,
    String? name,
    String? photo,
    String? email,
    String? lastname,
    List<dynamic>? pet,
  }) =>
      UserModel(
        id: id ?? this.id,
        gender: gender ?? this.gender,
        name: name ?? this.name,
        photo: photo ?? this.photo,
        email: email ?? this.email,
        lastname: lastname ?? this.lastname,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        gender: json["gender"],
        name: json["name"],
        photo: json["photo"],
        email: json["email"],
        lastname: json["lastname"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name,
        "photo": photo,
        "email": email,
        "lastname": lastname,
      };
}
