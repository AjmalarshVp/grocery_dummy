import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../services/dark_theme_prefs.dart';

part 'dark_theme_event.dart';

part 'dark_theme_state.dart';

bool globalIsDark = false;

class DarkThemeBloc extends Bloc<DarkThemeEvent, DarkThemeState> {
  DarkThemePrefs darkThemePrefs = DarkThemePrefs();

  DarkThemeBloc() : super(DarkThemeInitial()) {
    on<AppDarkTheme>((event, emit) {
      darkThemePrefs.setDarkTheme(event.isDark);
      globalIsDark = event.isDark;

      emit(AppThemeState(isDark: event.isDark));
    });
  }
}
