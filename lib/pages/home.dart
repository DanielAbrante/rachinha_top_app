import 'package:flutter/material.dart';
import 'package:rachinha_top_app/utils/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic user = ModalRoute.of(context)?.settings.arguments;

    final username = user?.split("@")[0];

    return Scaffold(
      appBar: AppBar(
        title: user != null
            ? Text("Bem-vindo, $username")
            : const Text("Bem-vindo, convidado"),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            },
            icon: const Icon(Icons.exit_to_app)),
      ),
      // drawer: AppDrawer(drawerItems: drawerItems),
      body: const Center(
        child: Text("Perfil de usuário"),
      ),
    );
  }
}
