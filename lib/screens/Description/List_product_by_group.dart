import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/Tiles/tile_liste_product.dart';
import 'package:stock_pharma/widgets/widgets.dart';
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
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Save_sales()));
            },
            child: Container(
              padding: EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
              height: 120,
              child: Card(
                child: Row(
                  children: [
                    Image_produit(),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Paracetamol',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text('500'+ ' ' +'g'),
                          SizedBox(height: 5,),
                          Text('Categorie : Analgesique'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      child: Column(children: [
                        Text('1.000' + ' '+'\$', style: TextStyle(fontSize: 15),),
                        SizedBox(height: 12,),
                        Text('50000', style: TextStyle(fontSize: 13),),
                        Text('Disponibles', style: TextStyle(fontWeight: FontWeight.bold),),
                      ],),
                    ),
                  ],
                ),
              ),
            ),
          ),
          /*dashlistproducts(
            designation: 'Paracetamol',
            mg: '500g',
            description: 'Categorie : Analgésique',
            prix: '1.000',
            nombre: '50',
          ),*/
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
