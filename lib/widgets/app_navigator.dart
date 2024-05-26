import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rachinha_top_app/controllers/racha_list.dart';
import 'package:rachinha_top_app/pages/home.dart';
import 'package:rachinha_top_app/pages/racha_list.dart';
import 'package:rachinha_top_app/pages/timer.dart';

class AppNavigator extends StatefulWidget {
  const AppNavigator({super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

class _AppNavigatorState extends State<AppNavigator> {
  List<Widget> pages = [
    const HomePage(),
    const RachaListPage(),
    const TimerPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => RachaListController(),
        child: Scaffold(
          body: pages[currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              currentIndex: currentIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), label: "Início"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.group), label: "Lista do Racha"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.timer_sharp), label: "Tempo"),
              ]),
        ));
  }
}
