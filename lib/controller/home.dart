import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_music/model/raw_model/bar_choice.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  int currentIndex = 0;
  List<BarChoice> items = [
    BarChoice(label: "Musique", iconData: Icons.music_note, page: Container()),
    BarChoice(label: "Favoris", iconData: Icons.whatshot, page: Container()),
    BarChoice(label: "Recherche", iconData: Icons.search, page: Container()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Spacer(),
                    Icon(Icons.radio),
                    Icon(Icons.doorbell),
                    Icon(Icons.settings)
                  ],
                ),
                items[currentIndex].titleForAppBar
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Text("MaxTube"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: items.map((i) => i.item).toList(),
        onTap: barTapped,
      ),
    );
  }

  barTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}