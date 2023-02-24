import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:stock_pharma/models/models.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';

import '../../provider/provider/apiProvider.dart';

class Save_dette extends StatefulWidget {

  Save_dette({Key? key}) : super(key: key);

  @override
  State<Save_dette> createState() => _Save_detteState();

}

class _Save_detteState extends State<Save_dette> {

  final client = TextEditingController();
  final type = TextEditingController();
  final quantity = TextEditingController();
  final date = TextEditingController();
  final fournisseur = TextEditingController();

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
                  controller: type,
                  label: 'Type de dette',
                  hint: 'Veuillez entrer le type de dette',
                ),
                employTextField(
                  width: 330,
                  controller: quantity,
                  label: 'Quantité sortie',
                  hint: 'Veuillez entrer la quantité',
                ),
                employTextField(
                  width: 330,
                  controller: date,
                  label: 'Date de don de dette',
                  hint: 'Veuillez choisir la date',
                ),
                employTextField(
                  width: 330,
                  controller: fournisseur,
                  label: 'Fournisseur ou client',
                  hint: 'Donnez le nom du founisseur',
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
                                formePharma: quantity.text,
                                dateVente:date.text,
                                status:fournisseur.text,
                                client:client.text,
                                qty: type.text,
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
    type.clear();
    quantity.clear();
    date.clear();
    fournisseur.clear();
  }
}

