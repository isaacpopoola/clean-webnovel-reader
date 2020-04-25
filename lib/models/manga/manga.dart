import 'chapter.dart';
import 'package:flutter/foundation.dart';

class Manga {
  String _title;
  String _author;
  String _artist;
  String _description;
  String _source;
  String _thumbnailUrl;
  String _mangaUrl;
  List<Chapter> _chapters;

  Manga({
    @required String title, 
    String author = "unknown",
    String artist = "unknown",
    String description = "unknown",
    @required String source,
    String thumbnailUrl = "N/A",
    @required String mangaUrl,
    }) : 
    _title = title,
    _author = author,
    _artist = artist,
    _description = description,
    _source = source,
    _thumbnailUrl = thumbnailUrl,
    _mangaUrl = mangaUrl;

    @override
  String toString() {
    // TODO: implement toString
    print("Title:\t$_title\nAuthor:\t$_author\nArtist:\t$_artist\nDescription:\t$_description\nSource:\t$_source");
    return super.toString();
  }
  
}
