part of 'dark_theme_bloc.dart';

@immutable
abstract class DarkThemeEvent {}

class AppDarkTheme extends DarkThemeEvent {
  final bool isDark;

  AppDarkTheme({required this.isDark});
}
