import 'package:flutter_story_app_concept/redux/states/app_state.dart';
import 'package:flutter_story_app_concept/redux/actions/actions.dart';
import 'package:flutter_story_app_concept/models/manga/manga.dart';


AppState reducer(AppState oldState, dynamic action){

  switch (action.runtimeType) {
    case FetchPopularMangaAction:{
      print("Updating Popular Manga in Reducer");
      List<Manga> newPopularManga= oldState.popularManga; 
      newPopularManga.addAll(action.popManga);
      for (int i = 0; i < newPopularManga.length; i++){
        print("INDEX: $i, MANGA: "+ newPopularManga[i].title);
      }
      return oldState.copyWith(popularManga: newPopularManga);
    }  
    break;
    
    default:{

    }
    break;
  }

  return oldState;
}