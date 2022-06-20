import 'package:flutter/material.dart';
import 'package:flutter_test_task/screens/tansactions_history/test_screen.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
            primary: Colors.white, side: BorderSide(color: Colors.white)),
        onPressed: () {
          Navigator.pushNamed(context, TransactionsHistoryScreen.routeName);
        },
        child: Text('Transaction History'),
      ),
    );
  }
}
