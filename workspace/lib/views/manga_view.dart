import 'package:flutter/material.dart';
import 'package:flutter_story_app_concept/models/manga/manga.dart';

class MangeView extends StatefulWidget {
  // MangeView({Key key}) : super(key: key);
  
  final Manga manga;
  final String callerPage;

  MangeView({
    @required this.manga, 
    this.callerPage,
  }) : assert(manga != null);

  @override
  _MangeViewState createState() => _MangeViewState();
}

class _MangeViewState extends State<MangeView> {
  bool favorite = false;
  bool bookmark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 220.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          widget.manga.src,
                        ),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                  Container(
                    height: 220.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, Color(0xFF000000)]
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 130.0
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Hero(
                              tag: "manga_view", // TODO: Use proper tags like -> '${widget.callerPage}${widget.movie.name}'
                              child: Container()//////HERERERERE
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ) ,
      ),
    );
  }
}