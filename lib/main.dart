import 'package:flutter/material.dart';
import './chart.dart';
import './input.dart';
import './data.dart';
import './models/data_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Accounting',

      //styling the font 
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'QuickSand',
       
       // global text theme 
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'QuickSand',
          )
        ),

        //global appbar theme
        appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
            )
        )
      ),
      
      // end styling the font

      home:MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
 
 void _add(double ammount , String title ,DateTime date)
  {
    setState(() {
      Transactions.add(DataModel(
      id: Transactions.length.toString(),
      amount: ammount.toDouble(),
      title: title,
      date: date,
    )
    );
    
    });
    print(ammount);
    print(title);
  }


 
 
 void startnewTransaction(BuildContext context)
  {
    showModalBottomSheet(
      context: context,
      builder: (_){

        return GestureDetector(
          onTap: (){},
          child:Input(_add),
          behavior: HitTestBehavior.opaque,
          )  ;
      }
    );
  }

    final List<DataModel> Transactions = [
    // DataModel(
    //   id:'1',
    //   title:'Movies',
    //   amount:200,
    //   date:DateTime.now()
    // ),

    // DataModel(
    //   id:'2',
    //   title:'Internet',
    //   amount:1000,
    //   date:DateTime.now()
    // )
  ];

  List<DataModel> get _recentTransactions {
    return Transactions.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title : Text('Expenses Accounting'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_circle_outline),
          onPressed: (){ startnewTransaction(context);},
          )
        ],
         ),


      body: SingleChildScrollView(

      child:Column(

        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: <Widget>[
        
        Chart(_recentTransactions), // chart of last week data 
        Data(Transactions),
       // newTransaction(), 
        ],
      )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
       child: Icon(Icons.add),
       onPressed: (){ startnewTransaction(context);},
        ),


      

 
      );
    
  }
}



