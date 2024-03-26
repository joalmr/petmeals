part of 'pet_cubit.dart';

class PetState extends Equatable {
  final RequestStatus? status;
  final PetModel? pet;
  final List<AttentionsModel>? attentions;
  final FileImage? imageFile;

  const PetState({
    this.status = RequestStatus.idle,
    this.pet,
    this.attentions,
    this.imageFile,
  });

  PetState copyWith({
    final RequestStatus? status,
    final PetModel? pet,
    final List<AttentionsModel>? attentions,
    final DateTime? nextDate,
    final FileImage? imageFile,
  }) {
    return PetState(
      status: status ?? this.status,
      pet: pet ?? this.pet,
      attentions: attentions ?? this.attentions,
      imageFile: imageFile ?? this.imageFile,
    );
  }

  @override
  List<Object?> get props => [
        status,
        pet,
        attentions,
        imageFile,
      ];
}
