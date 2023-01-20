import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/Forms/add_group_product.dart';
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
                children: [
                  dashProductTile(text: 'Comprimés'),
                  dashProductTile(text: 'Pommades'),
                ],
              ),
              Row(
                children: [
                  dashProductTile(text: 'Sirop'),
                  dashProductTile(text: 'Crèmes'),
                ],
              ),
              Row(
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
