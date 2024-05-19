import 'package:flutter/material.dart';

class TeamsPage extends StatelessWidget {
  const TeamsPage({super.key});

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
        body: SingleChildScrollView(
            child: ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: teamsQuantity,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text("Time 0${index + 1}"),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, player) {
                return Text(teams[index][player]);
              },
              itemCount: teams[index].length,
            )
          ],
        );
      },
    )));
  }
}
