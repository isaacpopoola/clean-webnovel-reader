import 'page.dart';
import 'package:flutter/foundation.dart';

class Chapter {
  final int chapterNumber;
  final String chapterTitle;
  final List<Page> pages;

  Chapter({
    @required this.chapterNumber, 
    @required this.chapterTitle, 
    @required this.pages
    });


}