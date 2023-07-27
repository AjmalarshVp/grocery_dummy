part of 'dark_theme_bloc.dart';

@immutable
abstract class DarkThemeState {}

class DarkThemeInitial extends DarkThemeState {}
class AppThemeState extends DarkThemeState{
  final bool isDark;
  AppThemeState({required this.isDark});
}