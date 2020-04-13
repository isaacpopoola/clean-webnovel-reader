import 'package:meta/meta.dart';
import '../manga/manga_preview.dart';

@immutable
class AppState {
  final MangaPreview user;

  AppState({
    this.user,
  });

  factory AppState.initial() => AppState(
    user: MangaPreview.initial(),
  );

  AppState copyWith({
    MangaPreview user,
  }) {
    return AppState(
      user: user ?? this.user,
    );
  }