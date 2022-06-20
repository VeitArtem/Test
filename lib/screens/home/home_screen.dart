import 'package:flutter/material.dart';
import 'package:flutter_test_task/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home Screen"),
      ),
      body: Body(),
    );
  }
}
