
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/combonant/componant.dart';
import 'package:news_app1/cubit/cubit.dart';
import 'package:news_app1/cubit/states.dart';
class BusinessScreen extends StatelessWidget{
  int selectScreen;
  @override
  Widget build(BuildContext context) {
    var list =NewsAppCubit.get(context).Business;
    return  BlocConsumer<NewsAppCubit,NewsAppStates>(
      listener: (context,state){},
      builder:(context,state)=> ConditionalBuilder(

        condition:list.length > 0,
        builder:(context)=>
            ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>buidItem(list[index],context),
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: double.infinity,
                    height: 1.0,
                    color: Colors.grey[300],
                  ),
                ),
                itemCount:list.length ),
        fallback: (context)=> Center(child: CircularProgressIndicator()),


      ),

    );
      //buildScreens(NewsAppCubit.get(context).Business,context);
  }


}
