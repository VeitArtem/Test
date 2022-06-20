import 'package:flutter/widgets.dart';
import 'package:flutter_test_task/screens/home/home_screen.dart';
import 'package:flutter_test_task/screens/tansactions_history/test_screen.dart';

final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  TransactionsHistoryScreen.routeName: (context) => TransactionsHistoryScreen(),
};
