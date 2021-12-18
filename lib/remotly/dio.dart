import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper{
  static Dio dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      )
    );
    }
  static Future <Response> getDAta({
      @required String url,

      @required dynamic query
     })
    async{
  return await dio.get(url,queryParameters: query);
    }
    }

