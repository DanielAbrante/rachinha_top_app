import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ErrorDialog extends StatelessWidget {
  final AuthException error;

  const ErrorDialog({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    final String customMessageError = errorMessages(error);

    return AlertDialog(
      title: const Text('Erro'),
      content: Text(customMessageError),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Tentar novamente'),
        ),
      ],
    );
  }
}

String errorMessages(AuthException error) {
  switch (error.message) {
    case "Invalid login credentials":
      return "Credenciais de login inválidas";
    case "You must provide either an email or phone number":
      return "Você deve inserir um email válido";
    case "Anonymous sign-ins are disabled":
      return "Email ou Senha inválido";
    case "Password should be at least 6 characters":
      return "A senha deve ter no mínimo 6 caracteres";
    case "Email rate limit exceeded":
      return "Não é possível criar uma conta no momento, tente novamente mais tarde";
    default:
      return "Infelizmente ocorreu um erro, tente novamente";
  }
}
