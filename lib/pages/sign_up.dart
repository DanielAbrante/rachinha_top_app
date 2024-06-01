import 'package:flutter/material.dart';
import 'package:rachinha_top_app/utils/app_routes.dart';
import 'package:rachinha_top_app/widgets/errors.dart';
import 'package:rachinha_top_app/widgets/input.dart';
import 'package:rachinha_top_app/widgets/logo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    Future<void> signUp(String email, String password) async {
      try {
        final AuthResponse response = await Supabase.instance.client.auth
            .signUp(email: email, password: password);

        if (response.user != null) {
          Navigator.pushReplacementNamed(context, AppRoutes.index,
              arguments: response.user?.email);
        }
      } catch (error) {
        if (error is AuthException) {
          print(error.message);

          showDialog(
              context: context,
              builder: (context) => ErrorDialog(error: error));
        }
      }
    }

    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Logo(),
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
                signUp(emailController.text.trim(),
                    passwordController.text.trim());
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
    );
  }
}
