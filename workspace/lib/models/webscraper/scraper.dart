import 'package:html/dom.dart';
import 'dart:io';

import '../manga/chapter.dart';
import '../manga/manga.dart';
import '../manga/manga_list.dart';
import '../manga/page.dart';
 
abstract class Scraper {

  Future<List<Manga>> parsePopularManga([int page = 1]);
  
  Manga createMangaObject(Element element);

  List<Manga> parseSearchedManga([int page = 1]);
  // Manga createSearchedMangaObject(Element element);

  // List<Chapter> getChapters(String mangaLink);

  
  
 
}