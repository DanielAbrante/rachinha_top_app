import 'package:flutter/material.dart';
import 'package:rachinha_top_app/utils/app_routes.dart';

class RachaListPage extends StatefulWidget {
  const RachaListPage({super.key});

  @override
  State<RachaListPage> createState() => _RachaListPageState();
}

class _RachaListPageState extends State<RachaListPage> {
  List<String> players = [];
  int playersPerTeam = 1;

  @override
  void initState() {
    super.initState();
    players.add("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista do Racha'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: TextField(
                        autofocus: players.length > 1,
                        decoration:
                            const InputDecoration(hintText: "Jogador(a)"),
                        keyboardType: TextInputType.name,
                        onChanged: (value) {
                          setState(() {
                            players[index] = value;
                          });
                        },
                        onSubmitted: (value) {
                          String lastPlayerEntry = players[players.length - 1];

                          if (lastPlayerEntry.isNotEmpty) {
                            setState(() {
                              players.add("");
                            });
                          }
                        },
                      ));
                },
              ),
              if (players.length > 2)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48),
                  child: Column(
                    children: [
                      Slider(
                        value: playersPerTeam.toDouble(),
                        min: 1.toDouble(),
                        max: players.length.floorToDouble(),
                        label: playersPerTeam.round().toString(),
                        onChanged: (double value) {
                          setState(() {
                            playersPerTeam = value.ceil();
                          });
                        },
                      ),
                      Text("Jogadores por time: ${playersPerTeam.floor()}"),
                    ],
                  ),
                ),
              ElevatedButton(
                  onPressed: () {
                    players.removeWhere((element) => element.isEmpty);

                    Navigator.pushNamed(context, AppRoutes.teams, arguments: {
                      "players": players,
                      "playersPerTeam": playersPerTeam
                    });
                  },
                  child: const Text("Sortear Times")),
            ],
          ),
        ));
  }
}
