import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Container(color: Colors.yellowAccent,);
  }

  onPressed() {

  }

  search(String string) {
    setState(() {
      
    });
  }

  save(String string) {

  }
}