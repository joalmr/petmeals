import 'package:petmeals/src/features/user/domain/entities/person_auth.dart';

class PersonAuthModel extends PersonAuthEntity {
  const PersonAuthModel(
    super.id,
    super.gender,
    super.name,
    super.photo,
    super.email,
    super.lastname,
  );

  factory PersonAuthModel.fromJson(json) {
    return PersonAuthModel(
      json['id'] as String,
      json['gender'] as int,
      json['name'] as String,
      json['photo'] as String,
      json['email'] as String,
      json['lastname'] as String,
    );
  }

  PersonAuthModel copyWith({
    String? id,
    int? gender,
    String? name,
    String? photo,
    String? email,
    String? lastname,
  }) {
    return PersonAuthModel(
      id ?? this.id,
      gender ?? this.gender,
      name ?? this.name,
      photo ?? this.photo,
      email ?? this.email,
      lastname ?? this.lastname,
    );
  }
}
