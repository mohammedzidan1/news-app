import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/cubit/states.dart';
import 'package:news_app1/remotly/catch.dart';
import 'package:news_app1/remotly/dio.dart';
import 'package:news_app1/screens/bussenes.dart';
import 'package:news_app1/screens/scince_screen.dart';

import 'package:news_app1/screens/sports.dart';

class NewsAppCubit extends Cubit<NewsAppStates> {
  NewsAppCubit() : super(InitialState());

  static NewsAppCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "science"),
    BottomNavigationBarItem(
        icon: Icon(Icons.business_sharp), label: "Business"),
  ];
  List<Widget> screens = [
    SportsScreen(),
    SciencesScreen(),
    BusinessScreen(),
  ];
  int currentIndex = 0;

  void changeBottomNavigatorItem(index) {
    currentIndex = index;
    emit(ChangeBottomNavigatorItemState());
  }

  List<dynamic> Business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];
  List<dynamic> search = [];
  bool changeMode = false;

  void changeModeForApp(
  {bool formShared}
      ) {
    if (formShared != null) {
      changeMode = formShared;
      emit(ChangeModeState());
    } else {
      changeMode = !changeMode;
      CatchHelper.putDAtaCatch(key: 'changeMode', value: changeMode).then((value) =>emit(ChangeModeState()));

    }}


  void getBusinessData({String value}) {
    emit(NewGetBusinessLoadingState());
    DioHelper.getDAta(url: 'v2/top-headLines', query: {
      'country': '$value',
      'category': 'business',
      'apiKey': '1d4efc58ffdf4373b88acd76da63186d',
    }).then((value) {
      print(value.data.toString());
      Business = value.data['articles'];
      emit(NewGetBusinessSucssesState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewGetBusinessErrorState(onError.toString()));
    });
  }

  void getSportsData({String value}) {
    emit(NewGetSportsLoadingState());
    DioHelper.getDAta(url: 'v2/top-headLines', query: {
      'country': '$value',
      'category': 'sports',
      'apiKey': '1d4efc58ffdf4373b88acd76da63186d',
    }).then((value) {
      print(value.data.toString());
      sports = value.data['articles'];
      emit(NewGetSportsSucssesState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewGetSportsErrorState(onError.toString()));
    });
  }

  void getScienceData(

      {String value}) {
    emit(NewGetScienceLoadingState());
    DioHelper.getDAta(url: 'v2/top-headLines', query: {
      'country': '$value',
      'category': 'science',
      'apiKey': '1d4efc58ffdf4373b88acd76da63186d',
    }).then((value) {
      print(value.data.toString());
      science = value.data['articles'];
      emit(NewGetScienceSucssesState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewGetScienceErrorState(onError.toString()));
    });
  }

  void getSearchData( String value) {
    emit(NewGetSearchLoadingState());
    DioHelper.getDAta(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '1d4efc58ffdf4373b88acd76da63186d',
    }).then((value) {
      print(value.data.toString());
      search = value.data['articles'];
      emit(NewGetSearchSucssesState());
    }).catchError((onError) {
      print(onError.toString());
      emit(NewGetSearchErrorState(onError.toString()));
    });
  }
}


