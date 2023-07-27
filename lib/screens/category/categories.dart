import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/screens/category/bloc/category_bloc.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/categories_widget.dart';
import 'package:grocery_app/widgets/text_widget.dart';

import 'bloc/category_bloc.dart';
import 'bloc/category_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);

  List<Color> gridColors = [
    const Color(0xff53B175),
    const Color(0xffF8A44C),
    const Color(0xffF7A593),
    const Color(0xffD3B0E0),
    const Color(0xffFDE598),
    const Color(0xffB7DFF5),
  ];

  List<Map<String, dynamic>> catInfo = [
    {
      'imgPath': 'assets/images/cat/fruits.png',
      'catText': 'Fruits',
    },
    {
      'imgPath': 'assets/images/cat/veg.png',
      'catText': 'Vegetables',
    },
    {
      'imgPath': 'assets/images/cat/Spinach.png',
      'catText': 'Herbs',
    },
    {
      'imgPath': 'assets/images/cat/nuts.png',
      'catText': 'Nuts',
    },
    {
      'imgPath': 'assets/images/cat/spices.png',
      'catText': 'Spices',
    },
    {
      'imgPath': 'assets/images/cat/grains.png',
      'catText': 'Grains',
    },
  ];
  List<String> categoryName = [];

  @override
  Widget build(BuildContext context) {
    final utils = Utils(context);
    Color color = utils.color;

    return BlocProvider(
      create: (context) => CategoryBloc()..add(FetchCategoriesEvent()),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoadedState) {
            categoryName = state.categories;
            print(state.categories);
          }
          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                title: TextWidget(
                  text: 'Categories',
                  color: color,
                  textSize: 24,
                  isTitle: true,
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 240 / 250,
                  crossAxisSpacing: 10,
                  // Vertical spacing
                  mainAxisSpacing: 10,
                  // Horizontal spacing
                  children: List.generate(categoryName.length, (index) {
                    return CategoriesWidget(
                      catText: categoryName[index],
                      imgPath: catInfo[index]['imgPath'],
                      passedColor: gridColors[index],
                    );
                  }),
                ),
              ));
        },
      ),
    );
  }
}
