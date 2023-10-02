import 'package:bloc/bloc.dart';
import 'package:comfypet/app/data/user/user_data.dart';
import 'package:comfypet/config/storage/storage.data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserData userData;
  UserCubit({required this.userData}) : super(UserInitial());

  User? user;
  String? uid = MyStorage().uid;
  String? name = MyStorage().name;
  String? photoUrl = MyStorage().photo;

  void signInGoogle() async {
    emit(UserLoading());
    final userResponse = await userData.signInGoogle();

    if (userResponse!.user == null) {
      throw Exception();
    }

    user = userResponse.user;

    uid = user?.uid;
    name = user?.displayName.toString().split(' ')[0];
    photoUrl = user?.photoURL;

    MyStorage().uid = uid!;
    MyStorage().name = name!;
    MyStorage().photo = photoUrl!;

    if (user != null) {
      emit(UserLoaded());
    }
    emit(UserError());
  }

  void getUser() async {
    await userData.getUser(uid!);
  }
}
