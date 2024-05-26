import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rachinha_top_app/controllers/racha_list.dart';

class PlayersList extends StatefulWidget {
  const PlayersList({super.key});

  @override
  State<PlayersList> createState() => _PlayersListState();
}

class _PlayersListState extends State<PlayersList> {
  @override
  Widget build(BuildContext context) {
    final rachaList = Provider.of<RachaListController>(context, listen: false);

    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: rachaList.players.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                autofocus: rachaList.players.length > 1,
                decoration: const InputDecoration(hintText: "Jogador(a)"),
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  setState(() {
                    rachaList.players[index] = value;
                  });
                },
                onSubmitted: (value) {
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
    );
  }
}
