import 'package:petmeals/app/presentation/get_it_views/home/views/home.dart';
import 'package:petmeals/app/presentation/get_it_views/pet/views/pet_add.dart';
import 'package:petmeals/app/presentation/get_it_views/pet/views/pet_detail.dart';
import 'package:petmeals/app/presentation/get_it_views/user/views/login.dart';
import 'package:petmeals/config/storage/storage.data.dart';
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
        return PetDetailView();
      },
    ),
  ],
);
