import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/cubit/cubit.dart';
import 'package:news_app1/cubit/states.dart';
import 'package:news_app1/remotly/dio.dart';
import 'package:news_app1/screens/search.dart';

class NewsLayOut extends StatelessWidget {
  var scaffoldKay = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsAppCubit.get(context);
          return
            Scaffold(
              key: scaffoldKay,
              appBar: AppBar(
                actions: [
                  IconButton(icon: Icon(Icons.search),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => SearchScreen()));
                      }
                  ),
                  IconButton(icon: Icon(Icons.brightness_4_outlined),
                      onPressed: () {
                        NewsAppCubit.get(context).changeModeForApp();
                      }),
                ],
                title: Text("News App"),
              ),
              body: cubit.screens[cubit.currentIndex],

              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeBottomNavigatorItem(index);
                },
                items: cubit.bottomItems,
                // cubit.bottomItems,


              ),
              // floatingActionButton: FloatingActionButton(
              //     child: Icon(Icons.edit),
              //     onPressed: () {
              //       scaffoldKay.currentState .showBottomSheet(
              //               (context) =>
              //               Container(
              //                 color: Colors.grey[100],
              //                 padding: EdgeInsets.all(20.0),
              //                 child:
              //
              //
              //                 TextFormField(
              //                   onChanged: (value){
              //                     NewsAppCubit.get(context).getBusinessData(value: value);
              //                     NewsAppCubit.get(context).getSportsData(value: value);
              //                     NewsAppCubit.get(context).getScienceData(value: value);
              //                   },
              //
              //                   decoration: InputDecoration(
              //                     //  hintText: "Task Title",
              //                     labelText: "Enter eg or us just",
              //                     prefixIcon: Icon(Icons.location_city),
              //
              //                     border: OutlineInputBorder(
              //                         borderRadius: BorderRadius.circular(6.0)),
              //                   ),
              //                 ),
              //
              //
              //
              //               ));
              //
              //       })

            );
        }
    );
  }
}

//https://newsapi.org/
// v2/everything?
// q=us&apiKey=b790b8164c89424a8138bfa5ddef5596

