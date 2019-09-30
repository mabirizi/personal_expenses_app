import 'package:flutter/material.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final List<Transaction> transaction = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 1200,
      date: DateTime.now(),

    ),
    Transaction(
      id: 't2',
      title: 'Bags',
      amount: 6000,
      date: DateTime.now(),

    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
          
                child: Container(
                  width: double.infinity,
                  child: Text('CHART'),
                ),
                elevation: 5,
              ),
            ),
            Card(
              child: Text('List of TX'),
            ),
          ],
        ));
  }
}
