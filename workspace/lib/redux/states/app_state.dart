import 'package:flutter_story_app_concept/models/manga/manga.dart';
import 'package:meta/meta.dart';


@immutable
class AppState {
  final List<Manga> popularManga;

  AppState({
    this.popularManga
  });


  factory AppState.initial() => AppState(
    popularManga: []
    );



  AppState copyWith({List<Manga> popularManga}) => AppState(
    popularManga: popularManga ?? this.popularManga
    );

}
