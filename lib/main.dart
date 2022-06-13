import 'package:flutter/material.dart';
// import 'package:mysql1/mysql1.dart';
import 'home.dart';
import './model/mysql.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void initState() {
  //   //TODO: implement initState
  //   super.initState();
  //   callGetConnectionMethod();
  // }

  // Future<void> callGetConnectionMethod() async {
  //   await MySql.getConnection();
  // }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Home()),
    );
  }
}
