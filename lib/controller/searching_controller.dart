import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_music/model/services/music_handler.dart';
import 'package:learn_music/views/cells/classic_tile.dart';

import '../model/raw_model/song.dart';

class SearchingController extends StatefulWidget {
  @override
  SearchingControllerState createState() => SearchingControllerState();
}

class SearchingControllerState extends State<SearchingController> {

  List<String> lastSearchedSongs = [];
  List<Song> searchResults = [];

  late TextEditingController textEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Container(
              height: 75,
              child: Row(
                children: [
                  Expanded(
                      child: TextField(
                        controller: textEditingController,
                        onChanged: search,
                        onSubmitted: save,
                        decoration: InputDecoration(
                          hintText: "Entrez quelque chose",
                        ),
                      )
                  ),
                  IconButton(
                      onPressed: onPressed,
                      icon: Icon(Icons.send)
                  )
                ],
              ),
            ),
            Text((textEditingController.text == "")
                ? "Dernières recherches"
                : "Nous avons trouvé pour vous",
              style: GoogleFonts.signika(
                color: Colors.red,
                fontSize: 20
              ),
            ),
            Expanded(
              child: (textEditingController.text == "")
                  ? emptyWidget()
                  : onSearchWidget(),
            )
          ],
        )
    );
  }

  Widget emptyWidget() {
    return Container(color: Colors.blueGrey,);
  }

  Widget onSearchWidget() {
    return ListView.separated(
        itemBuilder: (context, index) => ClassicTile(playlist: searchResults, index: index),
        separatorBuilder: ((context, index) => const Divider()),
        itemCount: searchResults.length
    );
  }

  onPressed() {

  }

  search(String string) {
    final result = MusicHandler().research(string);
    setState(() {
      searchResults = result;
    });
  }

  save(String string) {

  }
}