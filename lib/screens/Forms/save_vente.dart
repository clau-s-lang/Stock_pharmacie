
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:stock_pharma/models/models.dart';
import 'package:stock_pharma/widgets/widgets.dart';

import '../../provider/provider/apiProvider.dart';

class Save_sales extends StatefulWidget {
  final String productId;
  final double quantite;
  final double prixComp;
  final double prixFlac;
  final double prixPlaq;
  final double prixBoite;
  final String name;

  Save_sales(
      {Key? key,
      required this.name,
      required this.productId,
      required this.quantite,
      required this.prixComp,
      required this.prixPlaq,
      required this.prixBoite,
      required this.prixFlac})
      : super(key: key);

  @override
  State<Save_sales> createState() => _Save_salesState();
}

class _Save_salesState extends State<Save_sales> {
  final client = TextEditingController();
  final quantity = TextEditingController();
  final date = TextEditingController();
  String uniteMesure = 'Non specifié';
  final status = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enregister une vente'),
        backgroundColor: Color(0xFF0C8E36),
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Pony')
              .doc('Gallia')
              .collection('Produits')
              .doc(widget.productId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none) {
              return Material(
                  child: Center(
                      child: Text('Veuillez vous connecter à internet')));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Material(
                  child: Center(child: CircularProgressIndicator()));
            }

            print(widget.productId);
            if (!snapshot.hasData) {
              return Material(
                child: Center(
                  child: Text('Pas de données'),
                ),
              );
            }
            DocumentSnapshot doc = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 10),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      doc['name'],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 10),
                            child: Text(
                              'Unité de mesure',
                              style: TextStyle(fontSize: 17),
                            ),
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
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: 0,
                                title: Text(
                                  'Comprime',
                                ),
                                leading: Radio<String>(
                                  value: 'Comprime',
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
                          width: 330,
                          controller: quantity,
                          label: 'Quantité vendue',
                          hint: 'Veuillez entrer la quantité',
                        ),
                        /*employTextField(
                        width: 330,
                        controller: prixVente,//automatique
                        label: 'Prix de  vente',
                        hint: 'Veuillez entrer le prix',
                      ),*/
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                height: 30,
                                padding: EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 10),
                                textColor: Colors.white,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    try {
                                      setState(() {
                                        loading = true;
                                      });
                                   double coutTotal =0;

                                        if (uniteMesure == 'Boite'){
                                          coutTotal = double.parse(quantity.text) *
                                              widget.prixBoite;
                                        }else if(uniteMesure == 'Flacon'){
                                          coutTotal = double.parse(quantity.text) *
                                              widget.prixFlac;
                                        }else if(uniteMesure == 'Plaquette'){
                                          coutTotal = double.parse(quantity.text) *
                                              widget.prixPlaq;
                                        }else if(uniteMesure == 'Comprime'){
                                          coutTotal = double.parse(quantity.text) *
                                              widget.prixComp;
                                        };


                                      final vente = Vente(
                                        name: widget.name,
                                        uniteMesure: uniteMesure,
                                        prixVente: coutTotal,
                                        qty: double.parse(quantity.text),
                                      );

                                      final provider = Provider.of<ProviderApi>(
                                          context,
                                          listen: false);
                                      provider.addVente(vente: vente);
                                      provider.UpdateQtyV(
                                          quantV: double.parse(quantity.text),
                                          qty: widget.quantite,
                                          prodId: widget.productId);
                                    } catch (e) {
                                      Fluttertoast.showToast(msg: e.toString());
                                      setState(() {
                                        loading = false;
                                      });
                                    }
                                    clearFields();
                                    Navigator.pop(context);
                                  }
                                },
                                color: Color(0xFF0C8E36),
                                child: Text('Enregister une vente'),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  void clearFields() {
    client.clear();
    quantity.clear();
    date.clear();
    status.clear();
  }
}
