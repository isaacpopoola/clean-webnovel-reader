import 'package:dio/dio.dart';


Future<Response> GET(url) => Dio().get(url);

Future<Response> POST(url) => Dio().post(url);