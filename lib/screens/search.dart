import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/combonant/componant.dart';
import 'package:news_app1/cubit/cubit.dart';
import 'package:news_app1/cubit/states.dart';

class SearchScreen extends StatefulWidget {

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String emptyValue;
  @override
  Widget build(BuildContext context) {
    var list = NewsAppCubit.get(context).search;
    return BlocConsumer<NewsAppCubit, NewsAppStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                onChanged: (value) {

                  NewsAppCubit.get(context).getSearchData(value);
                  setState(() {
                    emptyValue=value;
                  });

                },

                decoration: InputDecoration(
                  //  hintText: "Task Title", 
                  labelText: "Search",
                  prefixIcon: Icon(Icons.search),

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0)),
                ),
              ),
            ),
            ConditionalBuilder(
              condition: list.length > 0,
              builder: (context) => Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buidItem(list[index], context),
                    separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            width: double.infinity,
                            height: 1.0,
                            color: Colors.grey[300],
                          ),
                        ),
                    itemCount: list.length),
              ),
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
          ],
        ),

      ),
    );
  }
}
