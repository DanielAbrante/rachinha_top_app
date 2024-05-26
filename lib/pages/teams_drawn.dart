import 'package:flutter/material.dart';

class TeamsDrawnPage extends StatelessWidget {
  const TeamsDrawnPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> playersListObject =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;

    dynamic playersPerTeam = playersListObject["playersPerTeam"];

    final List<String> players = playersListObject["players"] as List<String>;

    players.shuffle();

    int sempre = playersPerTeam;

    int teamsQuantity = (players.length / playersPerTeam).ceil();

    final List<List<String>> teams = List.generate(teamsQuantity, (_) => []);

    int start = 0;

    for (int x = 0; x < teamsQuantity; x++) {
      for (int i = start; i < playersPerTeam; i++) {
        if (i >= players.length) break;

        teams[x].add(players[i]);
      }

      start = playersPerTeam;
      playersPerTeam = playersPerTeam + sempre;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Times sorteados'),
        ),
        body: SingleChildScrollView(
            child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: teamsQuantity,
          itemBuilder: (context, index) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      "Time 0${index + 1}",
                      style: const TextStyle(fontSize: 26),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, player) {
                        return Text(
                          teams[index][player],
                          style: const TextStyle(fontSize: 22),
                        );
                      },
                      itemCount: teams[index].length,
                    )
                  ],
                ));
          },
        )));
  }
}
