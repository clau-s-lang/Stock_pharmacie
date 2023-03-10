import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/Forms/add_group_product.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class DashboardProduct extends StatefulWidget {
  const DashboardProduct({Key? key}) : super(key: key);

  @override
  State<DashboardProduct> createState() => _DashboardProductState();
}

class _DashboardProductState extends State<DashboardProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Groupe des produits'),
        backgroundColor: Color(0xFF0C8E36),
        actions: [
          Container(padding: EdgeInsets.all(10), child: Icon(Icons.search)),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ListDeProduitsVente(),));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 180,
                      height: 80,
                      child: Card(
                        child:  Container(
                            height: 20,
                            //width: 50,
                            child: Center(child: Text('Comprimés', style: TextStyle(fontWeight: FontWeight.bold),))
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ListDeProduitsVente(),));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 180,
                      height: 80,
                      child: Card(
                        child:  Container(
                            height: 20,
                            //width: 50,
                            child: Center(child: Text('Comprimés', style: TextStyle(fontWeight: FontWeight.bold),))
                        ),
                      ),
                    ),
                  ),
                  //dashProductTile(text: 'Pommades'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  dashProductTile(text: 'Sirop'),
                  dashProductTile(text: 'Crèmes'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  dashProductTile(text: 'Comprimés'),
                  dashProductTile(text: 'Comprimés'),
                ],
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddGroupProduct(),
          ));
          //Navigator.pushNamed(context, AddGroupProducts.routeName);
        },
        backgroundColor: Color(0xFF0C8E36),
        child: Icon(Icons.add),
      ),
    );
  }
}
