import 'package:petmeals/src/core/utils/storage/storage.data.dart';
import 'package:petmeals/src/features/pet/domain/entities/pet.dart';
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
        return const PetAddPage(myPet: null);
      },
    ),
    //context.push('/petdetail/update', extra: true);
    GoRoute(
      path: '/petdetail',
      builder: (BuildContext context, GoRouterState state) {
        var myPet = state.extra as PetEntity;
        return PetDetailPage(
          myPet: myPet,
        );
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'update',
          builder: (BuildContext context, GoRouterState state) {
            var myPet = state.extra as PetEntity;
            return PetAddPage(
              myPet: myPet,
            );
          },
        ),
      ],
    ),
  ],
);
