import 'package:app_todo/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primaryColor: Colors.orange,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor:  Colors.black,
          foregroundColor: Colors.white
        ),
        appBarTheme:
            const AppBarTheme(
              backgroundColor: Colors.orange
            ),
        scaffoldBackgroundColor: Colors.orange[200],
      ),
    );
  }
}
