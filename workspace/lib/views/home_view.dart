import 'package:flutter/material.dart';
import 'package:flutter_story_app_concept/components/card_scroll_widget.dart';
import '../customIcons.dart';
import './manga_view.dart';
import '../models/manga/manga.dart';
import 'package:redux/redux.dart';
import 'package:flutter_story_app_concept/models/manga/manga.dart';
import 'package:flutter_story_app_concept/redux/actions/actions.dart';
import '../redux/states/app_state.dart';
import 'package:flutter_story_app_concept/redux/actions/rest.dart';
import 'package:flutter_redux/flutter_redux.dart';


class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  double currentPage = 21.0;
  bool isCollapsed = true;
  double screenWidth, screenHeight;

  final Duration duration = const Duration(milliseconds: 300);
  PageController _controller;
  @override
  Widget build(BuildContext context) {
    print("_HomeScreenState: build()");

    _controller = PageController(initialPage: (currentPage - 1).toInt());
    _controller.addListener(() {
      setState(() {
        currentPage = _controller.page;
      });
    });

    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return StoreConnector<AppState, _ViewModel>( 
      converter: (store) => _ViewModel.create(store),
      onInitialBuild: (model) => model.fetchManga(1),
      builder: (context, model) => Container(
        // decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //         colors: [Color(0xFF1b1e44), Color(0xFF2d3447)],
        //         begin: Alignment.bottomCenter,
        //         end: Alignment.topCenter,
        //         tileMode: TileMode.clamp)),
        color: Color(0xFF2D3447),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // drawer: Drawer(
          //   child: ListView(
          //   // Important: Remove any padding from the ListView.
          //     padding: EdgeInsets.zero,
          //     children: <Widget>[
          //       DrawerHeader(
          //         child: Text('Drawer Header'),
          //         decoration: BoxDecoration(
          //           color: Colors.blue,
          //         ),
          //       ),
          //     ],
          //   )
          // ),//todo
          body: Builder(
            builder: (context) => SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
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
                              // Scaffold.of(context).openDrawer();
                            }, // trigger hamburger menu
                          ),
                        ]),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Popular",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 46.0,
                              fontFamily: "Calibre-Semibold",
                              letterSpacing: 1.0,
                            )),
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
                              color: Color(0xFFff6e6e),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 22.0, vertical: 6.0),
                              child: Text(
                                "Animated",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15.0),
                        Text(
                          "25+ Stories",
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ],
                    ),
                  ),
                  Hero(
                      tag: "managa_view",
                      child: GestureDetector(
                          onTap: () => Navigator.push(context, MaterialPageRoute(
                            builder: (context) => MangeView(manga: model.mangas[currentPage.toInt()]))),
                          child: Stack(children: <Widget>[
                            CardScrollWidget(currentPage, model.mangas),
                            Positioned.fill(
                                child: PageView.builder(
                              controller: _controller,
                              itemCount: 20,
                              reverse: true,
                              itemBuilder: (context, index) {
                                return null;
                              },
                            ))
                          ])))
                ],
              ),
            ),
          ),
        )));
  }
}


class _ViewModel {
  final List<Manga> mangas;
  final Function(int) fetchManga;

  _ViewModel({this.mangas, this.fetchManga});

  factory _ViewModel.create(Store<AppState> store) {
    _fetchManga(int page) {
      print("fetching");
      store.dispatch(getPopularManga(page));
    }

    return _ViewModel(
        fetchManga: _fetchManga, mangas: store.state.popularManga);
  }
}