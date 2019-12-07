import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  String ammountInput , titleInput;
  final add;

  Input(this.add);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Container(
      
      padding: EdgeInsets.all(10),

      child:Column(
        
       // crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[

        TextField(decoration: InputDecoration(
          labelText: 'Title',
          ),
          onChanged: (String val){ 
            titleInput = val;
          },
          ),
        TextField(decoration: InputDecoration(
          labelText: 'Ammount'
        ),
        onChanged: (String val){
          ammountInput = val;
        },
        ),

        FlatButton(
          child: Text('Add Transaction'),
          onPressed: (){
            // print(titleInput);
            // print(ammountInput);
            add(ammountInput,titleInput);
          },
          textColor: Colors.purple,
          )
      ],
      ),
      ),
    );
}
}