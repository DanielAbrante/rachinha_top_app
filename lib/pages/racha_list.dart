import 'package:flutter/material.dart';
import 'package:rachinha_top_app/widgets/racha_list/list_settings.dart';
import 'package:rachinha_top_app/widgets/racha_list/players_list.dart';

class RachaListPage extends StatelessWidget {
  const RachaListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista do Racha'),
      ),
      body: const Column(
        children: [
          PlayersList(),
          ListSettings(),
        ],
      ),
    );
  }
}
