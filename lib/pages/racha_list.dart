import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rachinha_top_app/controllers/racha_list.dart';
import 'package:rachinha_top_app/utils/app_routes.dart';

class RachaListPage extends StatefulWidget {
  const RachaListPage({super.key});

  @override
  State<RachaListPage> createState() => _RachaListPageState();
}

class _RachaListPageState extends State<RachaListPage> {
  @override
  Widget build(BuildContext context) {
    final rachaList = Provider.of<RachaListController>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista do Racha'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: rachaList.players.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: TextFormField(
                      autofocus: rachaList.players.length > 1,
                      decoration: const InputDecoration(hintText: "Jogador(a)"),
                      keyboardType: TextInputType.name,
                      initialValue: rachaList.players[index],
                      onChanged: (value) {
                        setState(() {
                          rachaList.players[index] = value;
                        });
                      },
                      onFieldSubmitted: (value) {
                        String lastPlayerEntry =
                            rachaList.players[rachaList.players.length - 1];

                        if (lastPlayerEntry.isNotEmpty) {
                          setState(() {
                            rachaList.players.add("");
                          });
                        }
                      },
                    ));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
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
            ]),
          ),
        ],
      ),
    );
  }
}
