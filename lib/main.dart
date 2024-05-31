import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:rachinha_top_app/app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  final supabaseUrl = dotenv.env['SUPABASE_URL'];
  final supabaseAnonKey = dotenv.env['SUPABASE_ANON_KEY'];

  if (supabaseUrl!.isEmpty || supabaseAnonKey!.isEmpty) {
    throw Exception(
        'Supabase URL ou AnonKey não foram encontrados no arquivo .env');
  }

  await Supabase.initialize(
      url: supabaseUrl, anonKey: supabaseAnonKey, debug: false);

  runApp(const App());
}
