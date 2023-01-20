import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/Tiles/tile_liste_product.dart';
class ListDeProduitsParGroupe extends StatefulWidget {
  const ListDeProduitsParGroupe({Key? key}) : super(key: key);

  @override
  State<ListDeProduitsParGroupe> createState() => _ListDeProduitsParGroupeState();
}

class _ListDeProduitsParGroupeState extends State<ListDeProduitsParGroupe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Comprimés'),
        backgroundColor: Color(0xFF0C8E36),
        actions: [
          Padding(padding: EdgeInsets.all(10), child: Icon(Icons.search),)
        ],
      ),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.all(20), child: Text('Produits',style: TextStyle(fontSize: 17),),),
          dashlistproducts(
            designation: 'Paracetamol',
            mg: '500g',
            description: 'Categorie : Analgésique',
            prix: '1.000',
            nombre: '50',
          ),
          dashlistproducts(
            designation: 'Amoxicilline',
            mg: '500g',
            description: 'Categorie : Antibiotique',
            prix: '1.500',
            nombre: '100',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProducts()));
        },
        child: Icon(Icons.add),
        backgroundColor:  Color(0xFF0C8E36),
      ),
    );
  }
}
