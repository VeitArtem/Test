import 'package:flutter/material.dart';
import 'package:flutter_test_task/const/constants.dart';

import 'components/body.dart';

class TransactionsHistoryScreen extends StatelessWidget {
  const TransactionsHistoryScreen({Key? key}) : super(key: key);

  static String routeName = "/transaction_history";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.ios_share_outlined,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Body(),
    );
  }
}
