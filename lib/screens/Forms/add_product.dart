import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stock_pharma/models/models.dart';
import 'package:stock_pharma/screens/Dashboard/edit_product.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';

import '../../provider/provider/apiProvider.dart';
import '../../utils/Loading/loading.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({Key? key}) : super(key: key);

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {

  final name = TextEditingController();
  final category = TextEditingController();
  final quantity = TextEditingController();
  final fournisseur = TextEditingController();
  final dateExp = TextEditingController();
  final description = TextEditingController();
  final formePharm = TextEditingController();
  final prix = TextEditingController();
  String uniteMesure = 'Non specifié';

  final _formKey =  GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        :Scaffold(
      appBar: AppBar(
        title: Text('Nouveau produit'),
        backgroundColor: Color(0xFF0C8E36),
      ),
      body: Scaffold(
        body: Padding(
          padding:
              const EdgeInsets.only(left: 15.0, right: 15, top: 20, bottom: 10),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      employTextField(
                        label: 'Nom du produit',
                        controller: name,
                      ),
                      employTextField(
                        label: 'Categorie du produit',
                        controller: category,
                      ),
                      employTextField(
                        label: 'Quantité',
                        controller: quantity,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text('Unité de mesure', style: TextStyle(fontSize: 17),),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 0,
                              title: Text(
                                'Non specifié',

                              ),
                              leading: Radio<String>(
                                value: 'Non specifié',
                                groupValue: uniteMesure,
                                onChanged: (value) {
                                  setState(() {
                                    uniteMesure = value!;
                                  });
                                },
                                activeColor: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 0,
                              title: Text(
                                'Boite',

                              ),
                              leading: Radio<String>(
                                value: 'Boite',
                                groupValue: uniteMesure,
                                onChanged: (value) {
                                  setState(() {
                                    uniteMesure = value!;
                                  });
                                },
                                activeColor: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 0,
                              title: Text(
                                'Flacon',

                              ),
                              leading: Radio<String>(
                                value: 'Flacon',
                                groupValue: uniteMesure,
                                onChanged: (value) {
                                  setState(() {
                                    uniteMesure = value!;
                                  });
                                },
                                activeColor: Color(0xFF216DAD),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              horizontalTitleGap: 0,
                              title: Text(
                                'Plaquette',

                              ),
                              leading: Radio<String>(
                                value: 'Plaquette',
                                groupValue: uniteMesure,
                                onChanged: (value) {
                                  setState(() {
                                    uniteMesure = value!;
                                  });
                                },
                                activeColor: Color(0xFF216DAD),
                              ),
                            ),
                          ),
                        ],
                      ),
                     employTextField(
                       label: 'Forme pharmaceutique',
                       controller: formePharm,
                     ),
                      employTextField(
                        label: 'Prix de vente',
                        controller: prix,
                      ),
                      Container(
                        width: 350,
                        child: TextFormField(
                          controller: dateExp,
                          // style: TextStyle(
                          //   fontSize: 15,
                          //   height: 0.5,
                          // ),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                lastDate: DateTime.now());
                            if (pickedDate != null) {
                              String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                              setState(() {
                                dateExp.text = formattedDate;
                              });
                            } else {
                              snackBarWidget(context,
                                  message: "La date n'est pas selectioné");
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Date d\'expiration',
                              hintText: 'Veuillez selectionner la date'
                          ),
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            try {
              setState(() {
                loading = true;
              });
              final prod = Product(
                name:name.text,
                categorie: category.text,
                qty: quantity.text as double,
                dateExp: DateTime.parse(dateExp.toString()),
                formePharm: formePharm.text,
                prix: prix.text as double,
                uniteMesure: uniteMesure
              );
              final provider = Provider.of<ProviderApi>(context,
                  listen: false);
              provider.addProd(prod: prod);
            } catch (e) {
              Fluttertoast.showToast(msg: e.toString());
              setState(() {
                loading = false;
              });
            }
            clearFields();
            Navigator.pop(context);
          }
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardUser()));
        },
        icon: Icon(Icons.check),
        label: Text('Enregistrer'),
        backgroundColor:Color(0xFF0C8E36) ,
      ),
    );
  }

  void clearFields() {
    name.clear();
    category.clear();
    quantity.clear();
  }
}

