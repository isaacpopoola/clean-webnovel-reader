import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import '../data.dart';

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    // PageController controller = PageController(initialPage: images.length - 1);
    // controller.addListener(() {
    //   setState(() {
    //     currentPage = controller.page;
    //   });
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text('Just Testing')
      )
    );


  }

}

