import 'package:flutter/material.dart';

class RachaListController extends ChangeNotifier {
  List<String> players = [""];
  int playersPerTeam = 1;

  void addPlayer({required String player}) {
    players.add(player);
    notifyListeners();
  }
}
