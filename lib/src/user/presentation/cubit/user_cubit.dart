import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:petmeals/config/storage/storage.data.dart';
import 'package:petmeals/src/infrastructure/request_status.dart';
import 'package:petmeals/src/user/domain/usecases/user_usecase.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userUsecase) : super(const UserState());
  final UserUsecase userUsecase;

  Future<void> signInGoogle() async {
    final userResponse = await userUsecase.signInGoogle();

    if (userResponse!.user == null) {
      throw Exception();
    } else {
      final user = userResponse.user;

      MyStorage().uid = user!.uid;
      MyStorage().name = user.displayName.toString().split(' ')[0];
      MyStorage().photo = user.photoURL!;

      emit(state.copyWith(
        user: user,
      ));
    }
  }

  Future<void> signOut() async {
    await userUsecase.signOut();
    MyStorage().box.erase();

    emit(state.copyWith(
      user: null,
    ));
  }
}
