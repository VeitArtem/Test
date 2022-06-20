import 'package:flutter/material.dart';
import 'package:flutter_test_task/const/routes.dart';
import 'package:flutter_test_task/const/theme.dart';
import 'package:flutter_test_task/screens/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Test',
      theme: theme(),
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
