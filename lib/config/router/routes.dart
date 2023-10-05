import 'package:comfypet/app/views/cubit/home/views/home.dart';
import 'package:comfypet/app/views/cubit/pet/views/pet_add.dart';
import 'package:comfypet/app/views/cubit/pet/views/pet_detail.dart';
import 'package:comfypet/app/views/cubit/user/views/login.dart';
import 'package:comfypet/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginView();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeView();
      },
    ),
    GoRoute(
      path: '/add',
      builder: (BuildContext context, GoRouterState state) {
        return PetAddView();
      },
    ),
    GoRoute(
      path: '/petdetail',
      builder: (BuildContext context, GoRouterState state) {
        return const PetDetailView();
      },
    ),
  ],
);

class RouterCubit extends Cubit<GoRouter> {
  RouterCubit() : super(_router) {
    MyStorage().uid.isNotEmpty ? goHome() : goLogin();
  }

  void goBack() {
    state.pop();
  }

  void goLogin() {
    state.go('/');
  }

  void goHome() {
    // state.go('/home');
    state.replace<String>('/home');
  }

  void goAdd() {
    state.go('/add');
  }

  void goPetDetail() {
    state.go('/petdetail');
  }
}
