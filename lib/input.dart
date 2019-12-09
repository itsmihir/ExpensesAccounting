import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Input extends StatefulWidget {
  final add;
  Input(this.add);
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  
  final ammountInput = TextEditingController();
  final titleInput = TextEditingController();
  DateTime inputDate ;
  _InputState();


  void submitData()
  { 
    if(double.parse(ammountInput.text)<0 || titleInput.text==''||inputDate==null)
    return ;

    widget.add(double.parse(ammountInput.text),titleInput.text,inputDate);

    Navigator.of(context).pop();
  }

  void _showDatePicker()
  {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),

    ).then((selectedDate){
      setState(() {
      inputDate = selectedDate;
       
      });
     });
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
        Padding(
          padding:EdgeInsets.all(10),
        child:Row(children: <Widget>[
          Expanded(
         child: Text(inputDate==null?'No Date Selected':'Selected Date : ${DateFormat.yMd().format(inputDate)}'),
          ),
          FlatButton(
            textColor: Theme.of(context).primaryColor,
            child: Text('Select Date' ,style: TextStyle(fontWeight: FontWeight.bold),),
            onPressed: _showDatePicker,
          )
          
        ],
        ),
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          child: Text('Add Transaction'),
          onPressed: submitData,
          textColor: Colors.white,
          )
      ],
      ),
      ),
    );
}
}

