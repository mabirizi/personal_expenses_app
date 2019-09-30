import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './models/transaction.dart';

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
  final List<Transaction> transactions = [
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

  // String titleInput;
  // String amountInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              elevation: 5,

              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),controller: titleController,
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                  ),
                  TextField(decoration: InputDecoration(labelText: 'Amount'),controller: amountController,
                  //  onChanged: (val) {
                  //     amountInput = val;
                  //   },
                  ),

                  FlatButton(child: Text('Add Tranaction'), 
                  textColor: Colors.purple,
                  onPressed: () {
                    print(titleController.text);
                    // print(titleInput);
                    // print(amountInput);
                  },
                  )
                ],
            ),
              ),),
            Column(
              children: transactions.map((tx) {
                return Card(
                  
                    child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        tx.amount.toString() + '/=',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(tx.title,
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),
                        ),
                        Text(
                          DateFormat.yMMMd().format(tx.date),
                        style: TextStyle(fontSize: 10, color: Colors.grey),),
                      ],
                    )
                  ],
                ));
              }).toList(),
            )
          ],
        ));
  }
}
