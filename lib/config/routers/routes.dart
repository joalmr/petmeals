import 'package:petmeals/src/pet/presentation/pages/home/home.dart';
import 'package:petmeals/src/pet/data/models/pet_model.dart';
import 'package:petmeals/src/pet/presentation/pages/actions/food.dart';
import 'package:petmeals/src/pet/presentation/pages/actions/leash.dart';
import 'package:petmeals/src/pet/presentation/pages/actions/litter.dart';
import 'package:petmeals/src/pet/presentation/pages/add/pet_add.dart';
import 'package:petmeals/src/pet/presentation/pages/detail/pet_detail.dart';
import 'package:petmeals/src/user/presentation/pages/login.dart';
import 'package:petmeals/config/storage/storage.data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: '/add',
      builder: (BuildContext context, GoRouterState state) {
        return const PetAddPage();
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
            var pet = state.extra as PetModel;
            return PetAddPage(petUpd: pet);
          },
        ),
        GoRoute(
          path: 'food',
          builder: (BuildContext context, GoRouterState state) {
            return const FoodPetPage();
          },
        ),
        GoRoute(
          path: 'leash',
          builder: (BuildContext context, GoRouterState state) {
            return const LeashPetPage();
          },
        ),
        GoRoute(
          path: 'litter',
          builder: (BuildContext context, GoRouterState state) {
            return const LitterPetPage();
          },
        ),
      ],
    ),
  ],
);
