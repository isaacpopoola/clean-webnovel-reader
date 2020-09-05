import 'package:flutter/material.dart';
import 'package:flutter_story_app_concept/models/manga/manga.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:math' as math;

class MangeView extends StatefulWidget {
  // MangeView({Key key}) : super(key: key);

  final Manga manga;
  final String callerPage;

  MangeView({
    @required this.manga,
    this.callerPage,
  }) : assert(manga != null);

  @override
  _MangeViewState createState() => _MangeViewState(this.manga, this.callerPage);
}

class _MangeViewState extends State<MangeView> {
  bool favorite = false;
  bool bookmark = false;
  Manga manga;
  String callerPage;

_MangeViewState(this.manga, this.callerPage);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
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
              )),
            ),
            Container(
              height: 220.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xFF000000)]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 130.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Hero(
                          transitionOnUserGestures: true,
                          tag:
                              "manga_view", // TODO: Use proper tags like -> '${widget.callerPage}${widget.movie.name}'
                          child: Container(
                            child: CachedNetworkImage(
                                        imageUrl: manga.cover,
                                        fit: BoxFit.cover,
                                        colorBlendMode: BlendMode.dstIn,
                                        placeholder: (context, url) => CircularProgressIndicator(),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
