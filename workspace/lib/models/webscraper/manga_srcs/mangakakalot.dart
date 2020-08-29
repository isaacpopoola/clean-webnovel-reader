import 'dart:developer';
import 'package:dio/dio.dart' as dio;
import 'package:html/parser.dart';
import 'package:html/dom.dart';

import 'package:flutter_story_app_concept/models/manga/manga.dart';
// import 'package:http/http.dart' as http;
import "../scraper.dart";

class Mangakakalot implements Scraper {
  static const String _name = "Mangakalot";
  static const String _baseUrl = "https://mangakakalot.com";
  static const String _language = "en";

  @override
  Future<List<Manga>> parsePopularManga([int page = 1]) async {
    String urlPath =
        "manga_list?type=topview&category=all&state=all&page=$page";
    Document document = new Document();

    print("Fetching Popular Pages");
    var response = await getPopularManga(urlPath);
    
    if (response.statusCode != 200) throw Exception(response.data); //TODO: Add a proper exception handler 
    print("SUCCESSFULL REQUEST");
    document = parse(response.data);
    

    print("Parsing Popular Pages");
    List<Element> links = document
        .querySelectorAll("div.truyen-list > div.list-truyen-item-wrap");
    
    List<Manga> mangas = new List();
    for (Element link in links) {
      // print("Parsing Manga Link");
      mangas.add(createMangaObject(link));
    }

    return mangas;
  }

  @override
  List<Manga> parseSearchedManga([int page = 1]) {
    // TODO: implement parseSearchedManga
    return null;
  }

  Future<dio.Response> getPopularManga(String query) =>
      dio.Dio().get("$_baseUrl/$query");

  @override
  Manga createMangaObject(Element element) => 
    new Manga(
      title: element.querySelector("h3 a").attributes["title"], 
      description: element.querySelector("p").text, 
      source: _name,
      mangaUrl: element.querySelector("h3 a").attributes["href"],
      thumbnailUrl: element.querySelector("a img").attributes["src"]
      );

}