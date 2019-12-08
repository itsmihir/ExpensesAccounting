import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatefulWidget {
  final add;
  Input(this.add);
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  
  final ammountInput = TextEditingController();
  final titleInput = TextEditingController();
  
  _InputState();


  void submitData()
  { 
    if(double.parse(ammountInput.text)<0 || titleInput.text=='')
    return ;

    widget.add(double.parse(ammountInput.text),titleInput.text);

    Navigator.of(context).pop();
  }

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
          ),
        TextField(decoration: InputDecoration(
          labelText: 'Ammount'
        ),
        controller: ammountInput,
         keyboardType: TextInputType.number,
      
        ),

        FlatButton(
          child: Text('Add Transaction'),
          onPressed: submitData,
          textColor: Colors.purple,
          )
      ],
      ),
      ),
    );
}
}

