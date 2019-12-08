import 'package:flutter/material.dart';
import './models/data_model.dart';
import 'package:intl/intl.dart';


class Data extends StatefulWidget {
 
  final List<DataModel> Transactions;

  Data(this.Transactions);
  @override
  _DataState createState() => _DataState(Transactions);
}

class _DataState extends State<Data> {
    

  final List<DataModel> Transactions;

  _DataState(this.Transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
      height:400,
      child:ListView.builder(
            itemCount: Transactions.length,
            itemBuilder: (context,index) {
                return Card( 
                child : Row(children: <Widget>[
                
                Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                    border: Border.all(
                    color: Colors.purple,
                    width: 1.5 
                   ),
                ),

                padding: EdgeInsets.all(10),
              
                child: Text('₹${Transactions[index].amount.toStringAsFixed(2)}' ,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.purple,
                  ),
                ),

                ),

                Column( 
                  
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
                  
                  Text(Transactions[index].title , 
                   style: TextStyle( fontSize: 15,
                   fontWeight: FontWeight.bold,
                  ),
                   ),
                  
                  
                  Text(
                    DateFormat.yMd().add_jm().format(Transactions[index].date),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12
                  ),
                  ),

                ],)

                ],)
                );
            },
              
          )
    );

  }
}
