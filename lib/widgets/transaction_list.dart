import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Container(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text('${transactions[index].amount}/='),),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                  ),
                );
                // return Card(
                //     child: Row(
                //   children: <Widget>[
                //     Container(
                //       margin:
                //           EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                //       decoration: BoxDecoration(
                //         border: Border.all(
                //             color: Theme.of(context).primaryColor, width: 2),
                //       ),
                //       padding: EdgeInsets.all(10),
                //       child: Text(
                //         transactions[index].amount.toStringAsFixed(2) + '/=',
                //         style: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: 20,
                //           color: Theme.of(context).primaryColor,
                //         ),
                //       ),
                //     ),
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: <Widget>[
                //         Text(
                //           transactions[index].title,
                //           style: Theme.of(context).textTheme.title,
                //         ),
                //         Text(
                //           DateFormat.yMMMd().format(transactions[index].date),
                //           style: TextStyle(fontSize: 10, color: Colors.grey),
                //         ),
                //       ],
                //     )
                //   ],
                // ));
              },
              itemCount: transactions.length,
            ),
    );
  }
}
