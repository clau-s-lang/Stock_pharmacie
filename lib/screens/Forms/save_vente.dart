import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:stock_pharma/models/models.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';

import '../../provider/provider/apiProvider.dart';

class Save_sales extends StatefulWidget {

  Save_sales({Key? key}) : super(key: key);

  @override
  State<Save_sales> createState() => _Save_salesState();

}

class _Save_salesState extends State<Save_sales> {

  final client = TextEditingController();
  final quantity = TextEditingController();
  final formePharma = TextEditingController();
  final date = TextEditingController();
  final status = TextEditingController();

  final _formKey =  GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enregister une vente'),
        backgroundColor: Color(0xFF0C8E36),
      ),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                employTextField(
                  width: 330,
                  controller: client,
                  label: 'Nom du Client',
                  hint: 'Veuillez entrer le nom du Client',
                ),
                employTextField(
                  width: 330,
                  controller: quantity,
                  label: 'Quantité vendue',
                  hint: 'Veuillez entrer la quantité',
                ),
                employTextField(
                  width: 330,
                  controller: formePharma,
                  label: 'Forme pharmaceutique',
                  hint: 'Veuillez entrer la forme pharmaceutique',
                ),
                employTextField(
                  width: 330,
                  controller: date,
                  label: 'Date de vente',
                  hint: 'Veuillez choisir la date',
                ),
                employTextField(
                  width: 330,
                  controller: status,
                  label: 'Status',
                  hint: 'Donnez un status',
                ),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        height: 30,
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        textColor: Colors.white,
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            try {
                              setState(() {
                                loading = true;
                              });
                              final vente = Vente(
                                formePharma: formePharma.text,
                                dateVente:date.text,
                                status:status.text,
                                client:client.text,
                                qty: quantity.text,
                              );
                              final provider = Provider.of<ProviderApi>(context,
                                  listen: false);
                              provider.addVente(vente: vente);
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
                        color: Color(0xFF0C8E36),
                        child: Text('Enregister une vente'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
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
  }

  void clearFields() {
    client.clear();
    quantity.clear();
    formePharma.clear();
    date.clear();
    status.clear();
  }
}

