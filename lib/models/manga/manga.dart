import 'chapter.dart';
import 'package:flutter/foundation.dart';

class Manga {
  final String title;
  final String author;
  final String artist;
  final String description;
  final String source;
  final String thumbnailUrl;
  final List<Chapter> chapters;

  Manga({
    @required this.title, 
    @required this.author, 
    this.artist, 
    @required this.description, 
    @required this.source,
    this.thumbnailUrl, 
    this.chapters
    });
}
