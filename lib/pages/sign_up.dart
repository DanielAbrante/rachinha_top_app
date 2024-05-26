import 'package:flutter/material.dart';
import 'package:rachinha_top_app/service/supabase_client.dart';
import 'package:rachinha_top_app/utils/app_routes.dart';
import 'package:rachinha_top_app/widgets/input.dart';
import 'package:rachinha_top_app/widgets/logo.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final supabaseClient = SupabaseInstance();

    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
            InputWidget(
              label: 'Email',
              controller: emailController,
            ),
            InputWidget(
              label: 'Senha',
              isPassword: true,
              controller: passwordController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  foregroundColor: Colors.blue[100],
                  minimumSize: const Size(300, 60),
                ),
                child: const Text('Criar conta'),
                onPressed: () {
                  supabaseClient.signUp(
                      email: emailController.text,
                      password: passwordController.text);

                  Navigator.of(context).pushNamed(AppRoutes.index,
                      arguments: {"email": emailController.text});
                },
              ),
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
