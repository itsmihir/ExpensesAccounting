import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final ammountInput = TextEditingController();
  final titleInput = TextEditingController();
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
          controller: titleInput,
          // onChanged: (String val){ 
          //   titleInput = val;
          // },
          ),
        TextField(decoration: InputDecoration(
          labelText: 'Ammount'
        ),
        controller: ammountInput,
        // onChanged: (String val){
        //   ammountInput = val;
        // },
        ),

        FlatButton(
          child: Text('Add Transaction'),
          onPressed: (){
            // print(titleInput);
            // print(ammountInput);
            add(double.parse(ammountInput.text),titleInput.text);
            
          },
          textColor: Colors.purple,
          )
      ],
      ),
      ),
    );
}
}