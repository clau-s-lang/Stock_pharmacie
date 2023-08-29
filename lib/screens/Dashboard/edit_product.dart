import 'package:flutter/material.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class EditProducts extends StatefulWidget {
  const EditProducts({Key? key}) : super(key: key);

  @override
  State<EditProducts> createState() => _EditProductsState();
}

class _EditProductsState extends State<EditProducts> {

  final name = TextEditingController();
  final price = TextEditingController();
  final quantity = TextEditingController();
  final fournisseur = TextEditingController();
  final description = TextEditingController();

  final _formKey =  GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier un produit'),
        backgroundColor: Color(0xFF0C8E36),
      ),
      body: Scaffold(
        body: Form(
          key: _formKey,
          child: Padding(
            padding:
            const EdgeInsets.only(left: 15.0, right: 15, top: 60, bottom: 10),
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Card(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Card(
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(top: 80, left: 10, right: 10),
                                child: employTextField(label: 'Paracétamol'),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                  child: Container(
                                    height: 60,
                                    width: 150,
                                    child: employTextField(
                                      height: 50,
                                      width: 100,
                                      label: '1000.0',
                                    ),

                                  ),
                                ),
                                Card(
                                  child: Container(
                                    height: 60,
                                    width: 150,
                                    child: employTextField(
                                      height: 50,
                                      width: 100,
                                      label: '500',
                                    ),

                                  ),
                                ),
                              ],
                            ),
                            Card(
                              child: Container(
                                width: 300,
                                height: 60,
                                child: employTextField(
                                  label: 'Pharmacie diocesaine',
                                ),
                              ),
                            ),
                            Card(
                              child: Container(
                                width: 300,
                                height: 60,
                                child: employTextField(
                                  label: 'Analgésique',
                                ),
                              ),
                            ),
                            Card(
                              child: Container(
                                width: 300,
                                height: 60,
                                child: employTextField(
                                  label: '25-03-2024',
                                ),
                              ),
                            ),

                          ],
                        ),

                      ),

                    ],
                  ),
                ),
                Positioned(
                  top: -10,
                  //bottom: 100,
                  left: 120,
                  child: Container(
                    height: 85,
                    width: 85,
                    child: Card(
                      color: Colors.white70,
                      child: Icon(Icons.image, color: Colors.grey,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.check),
        backgroundColor:Color(0xFF0C8E36) ,
      ),
    );
  }
}

