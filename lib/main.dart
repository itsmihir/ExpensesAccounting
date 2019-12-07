import './new_transaction.dart';
import 'package:flutter/material.dart';
import './chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'expenses_accounting',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return Scaffold(

      appBar: AppBar(
        title : Text('expenses_accounting'),
         ),


      body: SingleChildScrollView(

      child:Column(

        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
        
        Chart(), // chart of last week data 
        newTransaction(), 
        ],
      )
      )
      );
    
  }

}

