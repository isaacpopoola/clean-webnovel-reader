import 'dart:math';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_story_app_concept/redux/states/app_state.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_story_app_concept/models/manga/manga.dart';

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;


class CardScrollWidget extends StatelessWidget{
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;
  List<Manga> mangas;

  CardScrollWidget(this.currentPage, this.mangas);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    print("CardScrollWidget: build()");
    return AspectRatio(
          aspectRatio: widgetAspectRatio,
          
          child: LayoutBuilder(
            builder: (context, contraints) {
              print(
                  "CardScrollWidget: StoreConnector.builder->AspectRatio.builder");

              var width = contraints.maxWidth;
              var height = contraints.maxHeight;
              var safeWidth = width - 2 * padding;
              var safeHeight = height - 2 * padding;

              var heightOfPrimaryCard = safeHeight;
              var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

              var primaryCardLeft = safeWidth - widthOfPrimaryCard;
              var horizontalInset = primaryCardLeft / 2;

              List<Widget> cardList = new List();

              for (var i = 0; i < mangas.length; i++) {
                var delta = i - currentPage;
                bool isOnRight = delta > 0;

                var start = padding +
                    max(
                        primaryCardLeft -
                            horizontalInset * -delta * (isOnRight ? 15 : 1),
                        0.0);

                Widget cardItem = Positioned.directional(
                    top: padding + verticalInset * max(-delta, 0.0),
                    bottom: padding + verticalInset * max(-delta, 0.0),
                    start: start,
                    textDirection: TextDirection.rtl,
                    child:ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          offset: Offset(3.0, 6.0),
                                          blurRadius: 10.0)
                                    ]),
                                child: AspectRatio(
                                  aspectRatio: cardAspectRatio,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: <Widget>[
                                      CachedNetworkImage(
                                        imageUrl: mangas[i].cover,
                                        fit: BoxFit.cover,
                                        colorBlendMode: BlendMode.dstIn,
                                        placeholder: (context, url) => CircularProgressIndicator(),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      ),
                                      // Image.network(
                                      //   model.mangas[i].cover,
                                      //   fit: BoxFit.cover,
                                      //   colorBlendMode: BlendMode.dstIn,
                                      // ),
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16.0,
                                                  vertical: 8.0),
                                              child: Center(
                                                child: new Text(
                                                  mangas[i].title,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    // color: Color(0xFF1b1e44),
                                                    fontSize: 25.0,
                                                    fontFamily:
                                                        "SF-Pro-Text-Regular",
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10.0,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        );
                cardList.add(cardItem);
              }

              return Stack(children: cardList);
            },
          ),
        );
    
  }
}


