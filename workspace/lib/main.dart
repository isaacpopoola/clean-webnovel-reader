import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'views/home_view.dart';
import 'package:flutter_story_app_concept/redux/reducers/reducer.dart';
import 'package:flutter_story_app_concept/redux/states/app_state.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';



void main() {
  
  runApp(MyApp(
    new Store<AppState>(
      reducer,
      initialState: AppState.initial(),
      middleware:[thunkMiddleware]
    )
  ));
}



class MyApp extends StatelessWidget {
  final Store<AppState> _store;

  MyApp(this._store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: _store,
      child: MaterialApp(
      //title: ,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white
      ),
      home: InnerDrawer(
        leftChild: Container(),
        proportionalChildArea: false,
        onTapClose: true,
        offset: IDOffset.only(bottom: 0.00, right: 0.0, left: 0.6),
        scale: IDOffset.horizontal( 0.9 ),
        borderRadius: 20,
        leftAnimationType: InnerDrawerAnimation.quadratic,
        scaffold:HomeScreen(),
        )
      )
    );
    
  }
}

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// var cardAspectRatio = 12.0 / 16.0;
// var widgetAspectRatio = cardAspectRatio * 1.2;

// class _MyAppState extends State<MyApp> {
//   var currentPage = images.length - 1.0;

//   @override
//   Widget build(BuildContext context) {
//     PageController controller = PageController(initialPage: images.length - 1);
//     controller.addListener(() {
//       setState(() {
//         currentPage = controller.page;
//       });
//     });

//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               colors: [
//             Color(0xFF1b1e44),
//             Color(0xFF2d3447),
//           ],
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//               tileMode: TileMode.clamp)),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         drawer: Drawer(

//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     IconButton(
//                       icon: Icon(
//                         CustomIcons.menu,
//                         color: Colors.white,
//                         size: 30.0,
//                       ),
//                       onPressed: () {
//                         Scaffold.of(context).openDrawer();
//                       }, // trigger hamburger menu
//                     ),
//                     IconButton(
//                       icon: Icon(
//                         Icons.search,
//                         color: Colors.white,
//                         size: 30.0,
//                       ),
//                       onPressed: () {}, // trigger search in library
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text("Trending",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 46.0,
//                           fontFamily: "Calibre-Semibold",
//                           letterSpacing: 1.0,
//                         )),
//                     IconButton(
//                       icon: Icon(
//                         CustomIcons.option,
//                         size: 12.0,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {},
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20.0),
//                 child: Row(
//                   children: <Widget>[
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Color(0xFFff6e6e),
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       child: Center(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 22.0, vertical: 6.0),
//                           child: Text("Animated",
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15.0,
//                     ),
//                     Text("25+ Stories",
//                         style: TextStyle(color: Colors.blueAccent))
//                   ],
//                 ),
//               ),
//               Stack(
//                 children: <Widget>[
//                   CardScrollWidget(currentPage),
//                   Positioned.fill(
//                     child: PageView.builder(
//                       itemCount: images.length,
//                       controller: controller,
//                       reverse: true,
//                       itemBuilder: (context, index) {
//                         return Container();
//                       },
//                     ),
//                   )
//                 ],
//               ),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text("Favourite",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 46.0,
//                           fontFamily: "Calibre-Semibold",
//                           letterSpacing: 1.0,
//                         )),
//                     IconButton(
//                       icon: Icon(
//                         CustomIcons.option,
//                         size: 12.0,
//                         color: Colors.white,
//                       ),
//                       onPressed: () {},
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20.0),
//                 child: Row(
//                   children: <Widget>[
//                     Container(
//                       decoration: BoxDecoration(
//                         color: Colors.blueAccent,
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       child: Center(
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               horizontal: 22.0, vertical: 6.0),
//                           child: Text("Latest",
//                               style: TextStyle(color: Colors.white)),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15.0,
//                     ),
//                     Text("9+ Stories",
//                         style: TextStyle(color: Colors.blueAccent))
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Row(
//                 children: <Widget>[
//                   Padding(
//                     padding: EdgeInsets.only(left: 18.0),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20.0),
//                       child: Image.asset("assets/image_02.jpg",
//                           width: 296.0, height: 222.0),
//                     ),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


