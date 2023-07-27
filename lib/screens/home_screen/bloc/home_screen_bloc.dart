import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/dummy_date.dart';
import 'package:meta/meta.dart';

import '../../../model/product_model.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial(productList:productsList)) {
    on<HomeScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
