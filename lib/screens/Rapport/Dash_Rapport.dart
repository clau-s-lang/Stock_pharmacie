import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class DashboardRapport extends StatefulWidget {
  const DashboardRapport({Key? key}) : super(key: key);

  @override
  State<DashboardRapport> createState() => _DashboardRapportState();
}

class _DashboardRapportState extends State<DashboardRapport> {
  // late List<ChartData> data;

  /*@override
  void initState(){
    data = [
      ChartData(x: 'Lun', y:200),
      ChartData(x: 'Mard', y:350),
      ChartData(x: 'Mercr', y:400),
      ChartData(x: 'Jeu', y:150),
      ChartData(x: 'Vend', y:500),
      ChartData(x: 'Sam', y:800),
      ChartData(x: 'Dim', y:750),
    ];
  }*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0C8E36),
        actions: [
          GestureDetector(
              child: Icon(Icons.search,),
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>VenteJournalier(),
                ));
              }
          ),
        ],
      ),
      body: ListView(
        children: [
          entete_detail_dash(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Vendredi, 10 Mai 2022'),
                        Container(
                          width: 45,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text('-\$64', style: TextStyle(color: Colors.white),)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.grey,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      children: [
                        Icon(Icons.medical_information, size: 30,color: Colors.blue,),
                        SizedBox(width: 10,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Anti-malaria', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                            Text('Co-Arinate',)
                          ],
                        ),
                        SizedBox(width:120 ,),
                        Column(
                          children: [
                            Text('-\$13.52', style: TextStyle(color: Colors.red, fontSize: 18),),
                            Text('15:16'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/*class ChartData {
  final String x;
  final double y;

  ChartData({required this.x, reentequired this.y});


}*/
