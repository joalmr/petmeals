import 'package:petmeals/app/presentation/get_it/home/views/home.dart';
import 'package:petmeals/app/presentation/get_it/pet/views/pet_add.dart';
import 'package:petmeals/app/presentation/get_it/pet/views/pet_detail.dart';
import 'package:petmeals/app/presentation/get_it/pet/views/actions/food.dart';
import 'package:petmeals/app/presentation/get_it/pet/views/actions/leash.dart';
import 'package:petmeals/app/presentation/get_it/pet/views/actions/litter.dart';
import 'package:petmeals/app/presentation/get_it/user/views/login.dart';
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
    ),
    //
    GoRoute(
      path: '/food',
      builder: (BuildContext context, GoRouterState state) {
        return const FoodPetWidget();
      },
    ),
    GoRoute(
      path: '/leash',
      builder: (BuildContext context, GoRouterState state) {
        return const LeashPetWidget();
      },
    ),
    GoRoute(
      path: '/litter',
      builder: (BuildContext context, GoRouterState state) {
        return const LitterPetWidget();
      },
    ),
  ],
);
