import 'package:flutter/material.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class entete_detail_dash extends StatelessWidget {
  const entete_detail_dash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      padding: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 2),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Entete_Dash(),
            /*SfCartesianChart(
              borderWidth: 0,
              borderColor: Colors.transparent,
              plotAreaBorderWidth: 0,
              primaryXAxis: NumericAxis(
                minimum: 1,
                maximum: 7,
                isVisible: true,
                interval: 1,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),
              primaryYAxis: NumericAxis(
                minimum: 0,
                maximum: 1000,
                isVisible: true,
                interval: 100,
                borderWidth: 0,
                borderColor: Colors.transparent,
              ),

            ),*/
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Entrées", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(
                        '\$12 413',
                        style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sorties", style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(
                        '\$7 361',
                        style: TextStyle( fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
