import 'package:flutter/material.dart';

class chartDraw extends StatelessWidget {
  final String label;
  final double totalAmount;
  final double percentage;

  chartDraw(this.label, this.totalAmount, this.percentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: <Widget>[
          Container(
            child: Text(label),
            height: constraints.maxHeight * 0.15,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.0015,
          ),
/***************************************************************************************************************************/
          Container(
            height: constraints.maxHeight * 0.65,
            width: 10,
            child: Stack(
              children: <Widget>[
                // using stack to show the chart bar

                /*1*/ Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),

                /*2*/ FractionallySizedBox(
                  heightFactor: percentage,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                )
              ],
            ),
          ),
/****************************************************************************************************************************************/
          SizedBox(
            height: constraints.maxHeight * 0.0015,
          ),
          Container(
            height: constraints.maxHeight * 0.15,
            child: FittedBox(
              child: Text('₹${totalAmount}'),
            ),
          ),
        ],
      );
    });
  }
}
