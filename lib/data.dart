import 'package:flutter/material.dart';
import './models/data_model.dart';
import 'package:intl/intl.dart';


class Data extends StatefulWidget {
 
  final List<DataModel> Transactions;

  final _deleteTransaction;

  Data(this.Transactions,this._deleteTransaction);
  @override
  _DataState createState() => _DataState(Transactions);
}

class _DataState extends State<Data> {
    

  final List<DataModel> Transactions;



  _DataState(this.Transactions);

  @override
  Widget build(BuildContext context) {
    return Transactions.length==0?
    LayoutBuilder(builder: (ctx,constraints){

      return Column(children: <Widget>[
      Text('No Transactions added yet!',
      style: Theme.of(context).textTheme.title,
      ),
      
      SizedBox(height: 20,), // to add space between text and the image
      
      Container(
      height: constraints.maxHeight * 0.6,
      child:Image.asset('assets/images/waiting.png',fit: BoxFit.cover,),
      )
    ],
    );

    },
    )
    : ListView.builder(
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
                onPressed: (){widget._deleteTransaction(Transactions[index].id);},

              ),
                )
                );
            }

            
            
    );
  
  }
}
