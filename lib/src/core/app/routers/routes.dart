import 'package:petmeals/src/core/app/storage/storage.data.dart';
import 'package:petmeals/src/features/pet/data/models/pet_model.dart';
import 'package:petmeals/src/features/pet/presentation/views/detail/history/pet_history.dart';
import 'package:petmeals/src/features/pet/presentation/views/home/home.dart';
import 'package:petmeals/src/features/pet/presentation/views/add/pet_add.dart';
import 'package:petmeals/src/features/pet/presentation/views/detail/pet_detail.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petmeals/src/features/user/presentation/views/login.dart';
import 'package:petmeals/src/features/user/presentation/views/user.dart';

final GoRouter goRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MyStorage().uid.isNotEmpty
            ? const HomePage()
            : const LoginPage();
      },
    ),
    GoRoute(
      path: '/user',
      builder: (BuildContext context, GoRouterState state) {
        return const UserPage();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/add',
      builder: (BuildContext context, GoRouterState state) {
        var update = state.extra as bool;
        return PetAddPage(
          update: update,
        );
      },
    ),
    GoRoute(
      path: '/petdetail',
      builder: (BuildContext context, GoRouterState state) {
        return const PetDetailPage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'update',
          builder: (BuildContext context, GoRouterState state) {
            var update = state.extra as bool;
            return PetAddPage(
              update: update,
            );
          },
        ),
        GoRoute(
          path: 'history',
          builder: (BuildContext context, GoRouterState state) {
            var pet = state.extra as PetModel;
            return PetHistoryPage(pet: pet);
          },
        ),
      ],
    ),
  ],
);
