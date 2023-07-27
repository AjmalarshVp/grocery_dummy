import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/bloc/dark_theme/dark_theme_bloc.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/screens/category/bloc/category_bloc.dart';
import 'package:grocery_app/screens/home_screen/bloc/home_screen_bloc.dart';
import 'package:grocery_app/screens/home_screen/home_screen.dart';
import 'package:grocery_app/screens/orders/orders_screen.dart';
import 'package:grocery_app/screens/viewed_recently/viewed_recently.dart';
import 'package:grocery_app/screens/wishlist/wishlist_screen.dart';
import 'package:grocery_app/services/dark_theme_prefs.dart';
import 'package:provider/provider.dart';

import 'consts/theme_data.dart';
import 'inner_screens/feeds_screen.dart';
import 'inner_screens/on_sale_screen.dart';
import 'inner_screens/product_details.dart';
import 'screens/btm_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkTheme = false;
  DarkThemePrefs themeChangeProvider = DarkThemePrefs();

  Future<void> _loadThemeFromPreferences() async {
    isDarkTheme = await themeChangeProvider.getTheme();
  }

  @override
  void initState() {
    _loadThemeFromPreferences();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => DarkThemeBloc(),
          ),
          BlocProvider(
            create: (context) => HomeScreenBloc(),
          ),
          BlocProvider(
            create: (context) => CategoryBloc(),
          )
        ],
        child: BlocBuilder<DarkThemeBloc, DarkThemeState>(
          builder: (context, state) {
            if (state is AppThemeState) {
              isDarkTheme = state.isDark;
            }
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: Styles.themeData(isDarkTheme, context),
                home: const BottomBarScreen(),
                routes: {
                  OnSaleScreen.routeName: (ctx) => const OnSaleScreen(),
                  FeedsScreen.routeName: (ctx) => const FeedsScreen(),
                  ProductDetails.routeName: (ctx) => const ProductDetails(),
                  WishlistScreen.routeName: (ctx) => const WishlistScreen(),
                  OrdersScreen.routeName: (ctx) => const OrdersScreen(),
                  ViewedRecentlyScreen.routeName: (ctx) =>
                      const ViewedRecentlyScreen(),
                });
          },
        ));
  }
}
