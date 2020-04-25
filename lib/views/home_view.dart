import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import '../data.dart';

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class HomeScreen extends StatelessWidget{
  //   var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context){
    // PageController controller = PageController(initialPage: images.length - 1);
    // controller.addListener(() {
    //   setState(() {
    //     currentPage = controller.page;
    //   });
    // });
    

    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1b1e44),
              Color(0xFF2d3447)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            tileMode: TileMode.clamp
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // drawer: Drawer(),//todo
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    right: 12.0,
                    top: 30.0,
                    bottom: 8.0
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //children: <Widget>[
                        //IconButton(
//                       icon: Icon(
//                         CustomIcons.menu,
//                         color: Colors.white,
//                         size: 30.0,
//                       ),
//                       onPressed: () {
//                         Scaffold.of(context).openDrawer();
//                       }, // trigger hamburger menu
                      // ),
                     // ]
                    ),
                )
              ],
            
            ),
          ),
        ),
      );


  }

}

