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

  void _deleteTransaction(String id)
  {
    setState(() {
    Transactions.removeWhere((data){
      return data.id==id;
    });
    
    });
    }

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
      : 
      Container(
      height:450,
      child:ListView.builder(
            itemCount: Transactions.length,
            itemBuilder: (context,index) {
                return Card(
                  elevation: 10,
                  margin: EdgeInsets.symmetric(vertical: 4,horizontal: 10),
                child:ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child:
                            Padding(
                              padding: EdgeInsets.all(8),
                            child:FittedBox(
                            child:Text('₹${Transactions[index].amount}'),
                            )
                          ),
                  ),
              title: Text('${Transactions[index].title}',
              style: Theme.of(context).textTheme.title,
              
              ),
              subtitle: Text(DateFormat.yMMMd().format(Transactions[index].date)),
              
              //deleting transaction

              trailing: IconButton(
                icon: Icon(Icons.delete_outline),
                color: Theme.of(context).errorColor,
                onPressed: (){_deleteTransaction(Transactions[index].id);},

              ),
                )
                );
            }

            )
            
    );
  
  }
}
