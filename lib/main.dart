import 'package:flutter/material.dart';
import 'package:netflix/UI/screens/getStarted.dart';
import 'package:netflix/UI/screens/mainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Netflix',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.black,
      ),
      home:const 
       getStarterScreen(),
      routes: {
        '/main': (context) => NavScreen(),
      },
    );
  }
}
