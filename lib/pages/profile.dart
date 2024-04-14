import 'package:flutter/material.dart';
import 'package:rachinha_top_app/layout/drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      drawer: AppDrawer(drawerItems: drawerItems),
      body: const Center(
        child: Text("Perfil de usuário"),
      ),
    );
  }
}