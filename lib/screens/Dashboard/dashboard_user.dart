import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_pharma/provider/provider/apiProvider.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ListDeProduitsVente(),
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
                            Container(height:20,child: Center(child: Text('Ventes'))),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ListDeProduitsAppov(),
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ListDeProduitsStock(),
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
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>RapportVenteStock(),
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
                            Container(height:20,child: Center(child: Text('Rapport'))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ListDeProduitsStock(),
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
                  GestureDetector(
                    onTap: (){
                      final provider = Provider.of<ProviderApi>(context, listen: false);
                      provider.logOut();
                    },
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
                            Container(height:20,child: Center(child: Text('Deconnexion'))),
                          ],
                        ),
                      ),
                    ),
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
