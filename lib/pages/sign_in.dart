import 'package:flutter/material.dart';
import 'package:rachinha_top_app/utils/app_routes.dart';
import 'package:rachinha_top_app/widgets/errors.dart';
import 'package:rachinha_top_app/widgets/input.dart';
import 'package:rachinha_top_app/widgets/logo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn(String email, String password) async {
    try {
      final AuthResponse response = await Supabase.instance.client.auth
          .signInWithPassword(email: email, password: password);

      if (response.user != null) {
        Navigator.pushReplacementNamed(context, AppRoutes.index,
            arguments: response.user?.email);
      }
    } catch (error) {
      if (mounted) {
        if (error is AuthException) {
          showDialog(
              context: context,
              builder: (context) => ErrorDialog(error: error));
        }
      }
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                child: const Text('Entrar'),
                onPressed: () {
                  signIn(emailController.text.trim(),
                      passwordController.text.trim());

                  /* Navigator.of(context).pushNamed(AppRoutes.index,
                      arguments: {"email": emailController.text}); */
                },
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Não possui uma conta?"),
              TextButton(
                child: const Text('Criar Conta'),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signUp);
                },
              ),
            ],
          ),
          TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.index);
              },
              child: const Text("Entrar como convidado"))
        ],
      ),
    );
  }
}
