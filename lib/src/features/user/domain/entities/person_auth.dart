import 'package:equatable/equatable.dart';

class PersonAuthEntity extends Equatable {
  final String? id;
  final int? gender;
  final String? name;
  final String? photo;
  final String? email;
  final String? lastname;
  const PersonAuthEntity(
    this.id,
    this.gender,
    this.name,
    this.photo,
    this.email,
    this.lastname,
  );

  @override
  List<Object?> get props => [
        id,
        gender,
        name,
        photo,
        email,
        lastname,
      ];
}
