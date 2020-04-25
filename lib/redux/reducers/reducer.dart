import 'package:flutter_story_app_concept/redux/states/app_state.dart';
import 'package:flutter_story_app_concept/redux/actions/actions.dart';
import 'package:flutter_story_app_concept/models/manga/manga.dart';



AppState reducer(AppState oldState, dynamic action){

  switch (action) {
    case FetchPopularMangaAction:{
      List<Manga> newPopularManga= oldState.popularManga; 
      newPopularManga.addAll(action.popularManga);
      return oldState.copyWith(popularManga: newPopularManga);
    }  
    break;
    
    default:{

    }
    break;
  }

  return oldState;
}