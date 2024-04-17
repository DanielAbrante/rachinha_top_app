import 'package:flutter/material.dart';
import 'package:rachinha_top_app/layout/drawer.dart';
import 'package:rachinha_top_app/widgets/logo.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const LogoWidget(
          sourceImage: 'assets/images/logo.png',
          heightImage: 150.0,
          widthImage: 150.0,
        ),
        backgroundColor: Colors.blue[50],
      ),
      drawer: AppDrawer(drawerItems: drawerItems),
      body: Container(
        color: Colors.blue[100],
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(
              sourceImage: 'assets/images/icon-192x192.png',
              heightImage: 60.0,
              widthImage: 60.0,
            ),
            ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.blue[100],
                minimumSize: const Size(340, 36),
                padding: const EdgeInsets.symmetric(
                    horizontal: 22.0, vertical: 22.0),
              ),
              child: const Text('Salvar'),
              onPressed: () {},
            ),
            TextButton(
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}