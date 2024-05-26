import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rachinha_top_app/controllers/racha_list.dart';
import 'package:rachinha_top_app/utils/app_routes.dart';

class ListSettings extends StatefulWidget {
  const ListSettings({super.key});

  @override
  State<ListSettings> createState() => _ListSettingsState();
}

class _ListSettingsState extends State<ListSettings> {
  @override
  Widget build(BuildContext context) {
    final rachaList = Provider.of<RachaListController>(context, listen: false);

    return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(children: [
          if (rachaList.players.length > 2)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Slider(
                    value: rachaList.playersPerTeam.toDouble(),
                    min: 1.toDouble(),
                    max: rachaList.players.length.floorToDouble(),
                    label: rachaList.playersPerTeam.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        rachaList.playersPerTeam = value.ceil();
                      });
                    },
                  ),
                  Text(
                      "Jogadores por time: ${rachaList.playersPerTeam.floor()}"),
                ],
              ),
            ),
          ElevatedButton(
              onPressed: () {
                rachaList.players.removeWhere((element) => element.isEmpty);

                Navigator.pushNamed(context, AppRoutes.teams, arguments: {
                  "players": rachaList.players,
                  "playersPerTeam": rachaList.playersPerTeam
                });
              },
              child: const Text("Sortear Times")),
        ]));
  }
}
