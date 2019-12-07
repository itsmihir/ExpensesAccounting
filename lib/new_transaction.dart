import 'package:flutter/material.dart';
import './data.dart';
import './input.dart';
import './models/data_model.dart';

class newTransaction extends StatefulWidget {
  @override
  _newTransactionState createState() => _newTransactionState();
}

class _newTransactionState extends State<newTransaction> {
   
   final List<DataModel> Transactions = [
    DataModel(
      id:'1',
      title:'Movies',
      amount:200,
      date:DateTime.now()
    ),

    DataModel(
      id:'2',
      title:'Internet',
      amount:1000,
      date:DateTime.now()
    )
  ];

  void _add(double ammount , String title)
  {
    setState(() {
      Transactions._(DataModel(
      id: Transactions.length.toString(),
      amount: ammount.toDouble(),
      title: title,
      date: DateTime.now(),
    )
    );
    
    });
    print(ammount);
    print(title);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Input(_add),
      Data(Transactions),
    ],
    );
  }
}