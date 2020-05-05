import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_story_app_concept/components/card_scroll_widget.dart';
import '../customIcons.dart';



class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double currentPage = 8.0;
  
  @override
  Widget build(BuildContext context){
    print("_HomeScreenState: build()");
    PageController controller = PageController(initialPage: 11);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    

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
                      children: <Widget>[
                        IconButton(
                      icon: Icon(
                        CustomIcons.menu,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {
                        //Scaffold.of(context).openDrawer();
                      }, // trigger hamburger menu
                      ),
                     ]
                    ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Popular",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 46.0,
                          fontFamily: "Calibre-Semibold",
                          letterSpacing: 1.0,
                        )
                      ),
                      IconButton(
                        icon: Icon(
                          CustomIcons.option,
                          size: 12.0,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color:Color(0xFFff6e6e),
                          borderRadius: BorderRadius.circular(20.0)
                        ),
                        child:  Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:22.0, vertical: 6.0),
                            child: Text("Animated",
                              style: TextStyle( color: Colors.white),
                            ),
                          ) ,
                        ),
                      ),
                      SizedBox(
                        width: 15.0
                      ),
                      Text("25+ Stories",
                        style: TextStyle(color: Colors.blueAccent),
                      )
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    CardScrollWidget(currentPage),
                    Positioned.fill(
                      child: PageView.builder(
                        controller: controller,
                        itemCount: 7,
                        reverse:true,
                        itemBuilder:(context, index){
                          return Container();
                        },
                      )
                    )
                  ]
                )
              ],
            
            ),
          ),
        ),
      );


  }

}

// class HomeScreen extends StatelessWidget{
//     var currentPage = 10;

//   @override
//   Widget build(BuildContext context){
//     // PageController controller = PageController(initialPage: images.length - 1);
//     // controller.addListener(() {
//     //   setState(() {
//     //     currentPage = controller.page;
//     //   });
//     // });
    

//     return Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0xFF1b1e44),
//               Color(0xFF2d3447)
//             ],
//             begin: Alignment.bottomCenter,
//             end: Alignment.topCenter,
//             tileMode: TileMode.clamp
//           )
//         ),
//         child: Scaffold(
//           backgroundColor: Colors.transparent,
//           // drawer: Drawer(),//todo
//           body: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     left: 12.0,
//                     right: 12.0,
//                     top: 30.0,
//                     bottom: 8.0
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: <Widget>[
//                         IconButton(
//                       icon: Icon(
//                         CustomIcons.menu,
//                         color: Colors.white,
//                         size: 30.0,
//                       ),
//                       onPressed: () {
//                         //Scaffold.of(context).openDrawer();
//                       }, // trigger hamburger menu
//                       ),
//                      ]
//                     ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 20.0
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Text("Popular",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 46.0,
//                           fontFamily: "Calibre-Semibold",
//                           letterSpacing: 1.0
//                         )
//                       ),
//                       IconButton(
//                         icon: Icon(
//                           CustomIcons.option,
//                           size: 12.0,
//                           color: Colors.white,
//                         ),
//                         onPressed: () {},
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 20.0),
//                   child: Row(
//                     children: <Widget>[
//                       Container(
//                         decoration: BoxDecoration(
//                           color:Color(0xFFff6e6e),
//                           borderRadius: BorderRadius.circular(20.0)
//                         ),
//                         child:  Center(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(
//                               horizontal:22.0, vertical: 6.0),
//                             child: Text("Animated",
//                               style: TextStyle( color: Colors.white),
//                             ),
//                           ) ,
//                         ),
//                       ),
//                       SizedBox(
//                         width: 15.0
//                       ),
//                       Text("25+ Stories",
//                         style: TextStyle(color: Colors.blueAccent),
//                       )
//                     ],
//                   ),
//                 ),
//                 Stack(
//                   children: <Widget>[
//                     CardScrollWidget(1),
//                     Positioned.fill(
//                       child: PageView.builder(
//                         itemCount: 25,
//                         reverse:true,
//                         itemBuilder:(context, index){
//                           return Container();
//                         },
//                       )
//                     )
//                   ]
//                 )
//               ],
            
//             ),
//           ),
//         ),
//       );


//   }

// }

