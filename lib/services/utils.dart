import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/dark_theme/dark_theme_bloc.dart';
import '../provider/dark_theme_provider.dart';

class Utils {
  BuildContext context;

  Utils(
    this.context,
  );

  bool get getTheme => globalIsDark;

  Color get color => getTheme ? Colors.white : Colors.black;

  Size get getScreenSize => MediaQuery.of(context).size;
}
