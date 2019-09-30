import 'package:flutter/material.dart';


import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
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

  void _addNewTransaction(String txTitle, double txAmount){
     final newTx = Transaction(
       title: txTitle,
       amount: txAmount,
       date: DateTime.now(),
       id: DateTime.now().toString(),
     );

     setState(() {
       _userTransactions.add(newTx);
     });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList(_userTransactions),
      ],
    );
  }
}