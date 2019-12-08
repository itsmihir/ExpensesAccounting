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
    return Transactions.length==0?
    Column(children: <Widget>[
      Text('No Transactions added yet!',
      style: Theme.of(context).textTheme.title,
      ),
      
      SizedBox(height: 20,), // to add space between text and the image
      
      Container(
      height: 200,
      child:Image.asset('assets/images/waiting.png',fit: BoxFit.cover,),
      )
    ],)
      : Container(
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
                  style: Theme.of(context).textTheme.title,
                ),

                ),

                Column( 
                  
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: <Widget>[
                  
                  Text(Transactions[index].title , 
                   style: Theme.of(context).textTheme.title,
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
