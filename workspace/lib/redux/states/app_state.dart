import 'package:flutter_story_app_concept/models/manga/manga.dart';
import 'package:meta/meta.dart';


enum Navigations {LibraryClickedEvent, DownloadsClickedEvent, HomepageClickedEvent}


@immutable
class AppState {
  final List<Manga> popularManga;
  final Navigations route;

  AppState({
    this.popularManga,
    this.route
  });

  factory AppState.initial() => AppState(
    popularManga: [],
    route: Navigations.HomepageClickedEvent
    );

  AppState copyWith({List<Manga> popularManga, Navigations route}) => AppState(
    popularManga: popularManga ?? this.popularManga,
    route: route ?? this.route
    );

}