import 'package:comfypet/app/views/get_it/home/views/home.dart';
import 'package:comfypet/app/views/get_it/pet/views/pet_add.dart';
import 'package:comfypet/app/views/get_it/pet/views/pet_detail.dart';
import 'package:comfypet/app/views/get_it/user/views/login.dart';
import 'package:comfypet/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MyStorage().uid.isNotEmpty
            ? const HomeView()
            : const LoginView();
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
