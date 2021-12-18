
import 'package:flutter/material.dart';
import 'package:news_app1/screens/webview.dart';
Widget buidItem(articles,BuildContext context) {
  return InkWell(
    onTap: (){
      Navigator.push(context, MaterialPageRoute (builder: (context)=>WebViewScreen(url: articles['url'],),));
    },
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: NetworkImage("${articles['urlToImage']}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              // height: 120.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${articles['title']}",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    height: 2.0,
                  ),
                  Text(
                    '${articles['publishedAt']}',
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ) ,
                    // maxLines: 3,

                    // overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );

}
