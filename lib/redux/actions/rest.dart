import 'dart:developer';

import 'package:flutter_story_app_concept/models/manga/manga.dart';
import 'package:flutter_story_app_concept/models/webscraper/manga_srcs/mangakakalot.dart';
import 'package:flutter_story_app_concept/models/webscraper/scraper.dart';
import 'package:flutter_story_app_concept/redux/states/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'actions.dart';

ThunkAction<AppState> getPopularManga(int page) {
  return (Store<AppState> store) {
    log("getPopularManga: ThunkAction");
    Scraper scraper = new Mangakakalot();
    store.dispatch(FetchPopularMangaAction(popManga: scraper.parsePopularManga(page)));
  };
}

