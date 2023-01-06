import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class DashUserProduct extends StatefulWidget {
  static const String routeName = '/DashUserProduct';
  const DashUserProduct({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => DashUserProduct());
  }

  @override
  State<DashUserProduct> createState() => _DashUserProductState();
}

class _DashUserProductState extends State<DashUserProduct> {
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
          openDialog();
          //Navigator.pushNamed(context, AddGroupProducts.routeName);
        },
        backgroundColor: Color(0xFF0C8E36),
        child: Icon(Icons.add),
      ),
    );
  }

  Future openDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Ajouter un groupe de produit'),
              content: ListView(
                children: [
                  TextFormField(),
                ],
              ),
            ));
  }
}
