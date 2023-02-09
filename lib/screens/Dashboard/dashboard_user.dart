import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/Dashboard/dashboard_product.dart';
import 'package:stock_pharma/screens/Rapport/Dash_Rapport.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class DashboardUser extends StatefulWidget {
  const DashboardUser({Key? key}) : super(key: key);

  @override
  State<DashboardUser> createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBarDashUser(),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardProduct(),
                    ));},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 180,
                      height: 155,
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              //width: 50,
                              child: Image(
                                image: AssetImage('images/medoc.png'),
                              ),
                            ),
                            Container(height:20,child: Center(child: Text('Produits'))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ApprovisionementPage(),
                    ));},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 180,
                      height: 155,
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              //width: 50,
                              child: Image(
                                image: AssetImage('images/medoc.png'),
                              ),
                            ),
                            Container(height:20,child: Center(child: Text('Approvissionnement'))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ListDeProduitsParGroupe(),
                    ));},
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 180,
                      height: 155,
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              height: 100,
                              //width: 50,
                              child: Image(
                                image: AssetImage('images/medoc.png'),
                              ),
                            ),
                            Container(height:20,child: Center(child: Text('Stock'))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  dashUserTile(
                    text: 'Occasionnelles',
                  ),
                ],
              ),
              Row(
                children: [
                  dashUserTile(
                    text: 'Rapports',
                  ),
                  dashUserTile(
                    text: 'Ventes',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF0C8E36),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardProduct(),
          ));
        },
        //Icon(Icons.add),
      ),*/
    );
  }
}
