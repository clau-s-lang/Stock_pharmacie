// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';


import '../../provider/provider/apiProvider.dart';

class ModifierProduitPrix extends StatefulWidget {
  final String idProd;
  final String nom;
  final String uniteMesure;
  final String category;
  final String dateExp;
  final String formePharm;
  String prix;
  final String qty;

  ModifierProduitPrix({
    Key? key,
    required this.idProd,
    required this.qty,
    required this.nom,
    required this.uniteMesure,
    required this.category,
    required this.dateExp,
    required this.formePharm,
    required this.prix,
  }) : super(key: key);

  @override
  State<ModifierProduitPrix> createState() => _ModifierProduitPrixState();
}

class _ModifierProduitPrixState extends State<ModifierProduitPrix> {
  late String PU;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  void initState() {
    super.initState();
    PU = widget.prix;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier le prix unitaire de' + ' ' + widget.nom),
        backgroundColor: Color(0xFF0C8E36),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Container(
              child: Image(
                image: AssetImage('images/medocDesc-removebg-preview.png'),
              ),
            ),
            TextFormField(
              initialValue: widget.prix,
              decoration: InputDecoration(
                  label: Text('Nouveau prix unitaire'),
                  hintText: 'Saisir le nouveau prix unitaire'),
              validator: (e) => e!.isEmpty ? 'veuillez remplir le champ' : null,
              onChanged: (e) => PU = e,
            ),
            Expanded(
                child: MaterialButton(
                  height: 30,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                  textColor: Colors.white,
                  color: Color(0xFF0C8E36),
                  child: Text('Enregister la modification'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      widget.prix = PU;
                      try {
                        setState(() {
                          loading = true;
                        });
                        final prixunitaire = PU;
                        final provider =
                        Provider.of<ProviderApi>(context, listen: false);
                        provider.UpdatePriceProduit(prodId:widget.idProd,prix: prixunitaire,);
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
                ))
          ],
        ),
      ),
    );
  }

  void clearFields() {}
}
