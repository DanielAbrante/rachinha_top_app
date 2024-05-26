import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseInstance {
  late final client = Supabase.instance.client;

  signIn({email, password}) async {
    await Supabase.instance.client.auth
        .signInWithPassword(email: email, password: password);
  }

  signUp({email, password}) async {
    await Supabase.instance.client.auth
        .signUp(email: email, password: password);
  }
}
