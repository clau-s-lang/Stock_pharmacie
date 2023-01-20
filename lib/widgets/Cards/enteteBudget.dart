import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/Rapport/Dash_Rapport.dart';


class Entete_budget extends StatelessWidget {
  const Entete_budget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontSize: 12),),
                  Text('\$5 020', style: TextStyle(fontSize: 28),),
                  Text('-250\$ aujourd\'hui', style: TextStyle(fontSize: 8, color: Colors.red),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: FloatingActionButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardRapport()));
              },child: Icon(Icons.add),backgroundColor:Color(0xFF0C8E36) ,),
            )
          ],
        ),
      ),
    );
  }
}
