part of 'user_cubit.dart';

class UserState extends Equatable {
  final RequestStatus? status;
  final User? user;

  const UserState({
    this.status = RequestStatus.idle,
    this.user,
  });

  UserState copyWith({
    final RequestStatus? status,
    final User? user,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [
        status,
        user,
      ];
}
