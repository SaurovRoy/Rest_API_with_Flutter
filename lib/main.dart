import 'package:flutter/material.dart';
import 'package:get_api/Complex_Json_Api.dart';
import 'package:get_api/Get_Api.dart';
import 'package:get_api/Get_Api_Model_create.dart';
import 'package:get_api/display.dart';
import 'package:get_api/upload_image.dart';
import 'package:get_api/variable_api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Display(),
    );
  }
}

