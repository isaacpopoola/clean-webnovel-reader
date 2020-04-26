import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_story_app_concept/main.dart';
import 'package:flutter_story_app_concept/models/manga/manga.dart';
import 'package:flutter_story_app_concept/redux/actions/actions.dart';
import 'package:flutter_story_app_concept/redux/actions/rest.dart';
import 'package:flutter_story_app_concept/redux/states/app_state.dart';
import 'package:redux/redux.dart';

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class CardScrollWidget extends StatelessWidget{
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("CardScrollWidget: build()");
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel model) {
        
        model.fetchManga(1);

        return AspectRatio(
          aspectRatio: widgetAspectRatio,
          child: LayoutBuilder(
            builder: (context, contraints) {
            
              var width = contraints.maxWidth;
              var height = contraints.maxHeight;
              var safeWidth = width - 2 * padding;
              var safeHeight = height - 2 * padding;

              var heightOfPrimaryCard = safeHeight;
              var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

              var primaryCardLeft = safeWidth - widthOfPrimaryCard;
              var horizontalInset = primaryCardLeft / 2;
              
              List<Widget> cardList = new List();
              
              for (var i = 0; i < model.mangas.length; i++ ){
                var delta = i - currentPage;
                bool isOnRight = delta > 0;

                var start = padding + max(primaryCardLeft - horizontalInset * -delta * (isOnRight ? 15 : 1), 0.0);

                

                Widget cardItem = Positioned.directional(
                    
                  top: padding + verticalInset * max(-delta, 0.0),
                  bottom: padding + verticalInset * max(-delta, 0.0),
                  start: start,
                  textDirection: TextDirection.rtl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(3.0, 6.0),
                            blurRadius: 10.0
                          )
                        ]
                      ),
                      child: AspectRatio(
                        aspectRatio: cardAspectRatio,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Image.network(
                              model.mangas[i].cover, 
                              fit: BoxFit.cover,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 8.0
                                    ),
                                    child: Text(
                                      model.mangas[i].title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontFamily: "SF-Pro-Text-Regular"
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
                    )
                  ),
                
                );
                cardList.add(cardItem);
              }

    
              return Stack(
                children: cardList
              );
            },
          ),
        );
      },
    );
  }
}


class _ViewModel{
  final List<Manga> mangas;
  final Function(int) fetchManga;
  
  
  _ViewModel({
    this.mangas,
    this.fetchManga
  });

  factory _ViewModel.create(Store<AppState> store){
    
    _fetchManga(int page){
      store.dispatch(getPopularManga(page));
    }

    return _ViewModel(
      fetchManga: _fetchManga,
      mangas: store.state.popularManga
    );
  }
}

// class CardScrollWidget extends StatelessWidget {
//   var currentPage;
//   var padding = 20.0;
//   var verticalInset = 20.0;
  

//   CardScrollWidget(this.currentPage);

//   @override
//   Widget build(BuildContext context) {
//     return new AspectRatio(
//       aspectRatio: widgetAspectRatio,
//       child: LayoutBuilder(builder: (context, contraints) {
//         var width = contraints.maxWidth;
//         var height = contraints.maxHeight;

//         var safeWidth = width - 2 * padding;
//         var safeHeight = height - 2 * padding;

//         var heightOfPrimaryCard = safeHeight;
//         var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

//         var primaryCardLeft = safeWidth - widthOfPrimaryCard;
//         var horizontalInset = primaryCardLeft / 2;

//         List<Widget> cardList = new List();

//         for (var i = 0; i < images.length; i++) {
//           var delta = i - currentPage;
//           bool isOnRight = delta > 0;

//           var start = padding +
//               max(
//                   primaryCardLeft -
//                       horizontalInset * -delta * (isOnRight ? 15 : 1),
//                   0.0);

//           var cardItem = Positioned.directional(
//             top: padding + verticalInset * max(-delta, 0.0),
//             bottom: padding + verticalInset * max(-delta, 0.0),
//             start: start,
//             textDirection: TextDirection.rtl,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(16.0),
//               child: Container(
//                 decoration: BoxDecoration(color: Colors.white, boxShadow: [
//                   BoxShadow(
//                       color: Colors.black12,
//                       offset: Offset(3.0, 6.0),
//                       blurRadius: 10.0)
//                 ]),
//                 child: AspectRatio(
//                   aspectRatio: cardAspectRatio,
//                   child: Stack(
//                     fit: StackFit.expand,
//                     children: <Widget>[
//                       Image.asset(images[i], fit: BoxFit.cover),
//                       Align(
//                         alignment: Alignment.bottomLeft,
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 16.0, vertical: 8.0),
//                               child: Text(title[i],
//                                style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 25.0,
//                                       fontFamily: "SF-Pro-Text-Regular")),
//                             ),
//                             SizedBox(
//                               height: 10.0,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                   left: 12.0, bottom: 12.0),
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 22.0, vertical: 6.0),
//                                 decoration: BoxDecoration(
//                                     color: Colors.blueAccent,
//                                     borderRadius: BorderRadius.circular(20.0)),
//                                 child: Text("Read Later",
//                                     style: TextStyle(color: Colors.white)),
//                               ),
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//           cardList.add(cardItem);
//         }
//         return Stack(
//           children: cardList,
//         );
//       }),
//     );
//   }
// }