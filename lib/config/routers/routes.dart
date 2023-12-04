import 'package:petmeals/app/data/pet/models/pet_model.dart';
import 'package:petmeals/app/presentation/home/views/home.dart';
import 'package:petmeals/app/presentation/pet/views/pet_add.dart';
import 'package:petmeals/app/presentation/pet/views/pet_detail.dart';
import 'package:petmeals/app/presentation/pet/views/actions/food.dart';
import 'package:petmeals/app/presentation/pet/views/actions/leash.dart';
import 'package:petmeals/app/presentation/pet/views/actions/litter.dart';
import 'package:petmeals/app/presentation/user/views/login.dart';
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
        return const PetAddView();
      },
    ),
    GoRoute(
      path: '/petdetail',
      builder: (BuildContext context, GoRouterState state) {
        return PetDetailView();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'update',
          builder: (BuildContext context, GoRouterState state) {
            var pet = state.extra as PetModel;
            return PetAddView(petUpd: pet);
          },
        ),
        GoRoute(
          path: 'food',
          builder: (BuildContext context, GoRouterState state) {
            return const FoodPetWidget();
          },
        ),
        GoRoute(
          path: 'leash',
          builder: (BuildContext context, GoRouterState state) {
            return const LeashPetWidget();
          },
        ),
        GoRoute(
          path: 'litter',
          builder: (BuildContext context, GoRouterState state) {
            return const LitterPetWidget();
          },
        ),
      ],
    ),
  ],
);
