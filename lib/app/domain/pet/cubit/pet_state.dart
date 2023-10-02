part of 'pet_cubit.dart';

@immutable
sealed class PetState {}

final class PetInitial extends PetState {}

final class PetLoading extends PetState {}

final class PetAdded extends PetState {
  // final bool response;
  PetAdded();
}

final class PetDeleted extends PetState {}
