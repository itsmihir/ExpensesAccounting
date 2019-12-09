import './chart_draw.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './models/data_model.dart';
import 'package:intl/date_symbol_data_local.dart';


class Chart extends StatelessWidget {
  
   List<DataModel> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String,Object>> get rowsList {
    return List.generate(7, (index){
       final weekDay = DateTime.now().subtract(Duration(days:index));
       double totalAmount = 0;
       for (var i = 0; i < recentTransactions.length; i++) {
         if(recentTransactions[i].date.day==weekDay.day &&
          recentTransactions[i].date.month == weekDay.month &&
          recentTransactions[i].date.year == weekDay.year )
          {
            totalAmount+=recentTransactions[i].amount;
          }
       }
       
      return ({
        'day':DateFormat.E().format(weekDay).substring(0,1),
        'amount': totalAmount,
      });
    }
    ).reversed.toList();
  }

  double get totalSpend {
    return recentTransactions.fold(0.0, (sum,index)
    {
      return sum+index.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
   
     print(rowsList);
   return Padding(
      padding:EdgeInsets.all(10),
    child:Card(
     elevation: 1,
     child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
       children: rowsList.map((data)
       {
         return  Flexible(
           fit: FlexFit.loose,
         child:chartDraw(data['day'],data['amount'],
         totalSpend==0?0.0: (data['amount'] as double)/totalSpend
         )
         );
       }).toList(),
       )
   // child: Text('${rowsList}'),
    )
   );

  }
}