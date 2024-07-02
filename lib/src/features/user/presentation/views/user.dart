import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petmeals/src/core/app/styles/colors/colors.dart';
import 'package:petmeals/src/shared/shared.dart';
import 'package:petmeals/src/core/app/storage/storage.data.dart';
import 'package:petmeals/src/features/user/presentation/providers/user_provider.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = context.read<UserProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi cuenta'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Expanded(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundImage:
                          CachedNetworkImageProvider(MyStorage().photo),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      MyStorage().name,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ButtonSecondary(
                  color: mandy,
                  onPressed: () {
                    userProvider.signOut().then((value) => context.go("/"));
                  },
                  child: const Text('Cerrar sesión'),
                ),
              ),
              const SizedBox(height: 42),
            ],
          ),
        ),
      ),
    );
  }
}
