
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/cubit/cubit.dart';
import 'package:news_app1/cubit/states.dart';
import 'package:news_app1/remotly/dio.dart';
import 'package:news_app1/remotly/catch.dart';

import 'lay_out/news_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();

 await CatchHelper.init();
  bool chaneMode=CatchHelper.getDAtaCatch(key: 'changeMode');
  runApp(MyApp(chaneMode));

}


class MyApp extends StatelessWidget {

  @override
   final bool changeMode;
  MyApp(this.changeMode);
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsAppCubit()
        ..getSportsData(value: "eg")
        ..getScienceData(value: "eg")
        ..getBusinessData(value: "eg")..changeModeForApp(formShared: changeMode),
      child: BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.deepOrange,
            textTheme: TextTheme(
          bodyText1: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: Colors.black,
                  // opacity: 33,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                elevation: 0.0,
                backgroundColor: Colors.white,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w900)),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              // backgroundColor: Colors.black45,
              selectedItemColor: Colors.deepOrange,
              elevation: 20.0,

              backgroundColor: Colors.white,
              unselectedItemColor: Colors.black,
            ),
          ),
          darkTheme: ThemeData(
            primaryColor: Colors.white,
           // scaffoldBackgroundColor: HexColor('333739'),
            scaffoldBackgroundColor: Colors.black45,
            appBarTheme: AppBarTheme(
              titleSpacing: 20.0,
                iconTheme: IconThemeData(
                  color: Colors.white,
                  // opacity: 33,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
               //   statusBarColor: HexColor('333739'),
                  statusBarColor: Colors.black45,
                  statusBarIconBrightness: Brightness.light,
                ),
                elevation: 0.0,
            //    backgroundColor: HexColor('333739'),
                backgroundColor: Colors.black45,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w900)),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              // backgroundColor: Colors.black45,
              selectedItemColor: Colors.yellowAccent,
              elevation: 20.0,
            //  backgroundColor: HexColor('333739'),
              backgroundColor: Colors.redAccent,
              unselectedItemColor: Colors.white60,
            ),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ),
          themeMode:NewsAppCubit.get(context).changeMode ?ThemeMode.dark:ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: NewsLayOut(),
        ),
      ),
    );
  }
}
