// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';


import '../../provider/provider/apiProvider.dart';

class ModifierProduitNombre extends StatefulWidget {
  final String idProd;
  final String nom;
  final String uniteMesure;
  final String category;
  final String dateExp;
  final String formePharm;
  final String prix;
  String qty;

  ModifierProduitNombre({
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
  State<ModifierProduitNombre> createState() => _ModifierProduitNombreState();
}

class _ModifierProduitNombreState extends State<ModifierProduitNombre> {
  late String nombre;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  void initState() {
    super.initState();
    nombre = widget.qty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier la quantité de' + ' ' + widget.nom),
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
              initialValue: widget.qty,
              decoration: InputDecoration(
                  label: Text('Nouvelle quantité'),
                  hintText: 'Saisir la nouvelle quantité'),
              validator: (e) => e!.isEmpty ? 'veuillez remplir le champ' : null,
              onChanged: (e) => nombre = e,
            ),
            MaterialButton(
              height: 30,
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
              textColor: Colors.white,
              color: Color(0xFF0C8E36),
              child: Text('Enregister la modification'),
              onPressed: () async {
            if (_formKey.currentState!.validate()) {
              widget.qty = nombre;
              try {
                setState(() {
                  loading = true;
                });
                final quantity = nombre;
                final provider =
                    Provider.of<ProviderApi>(context, listen: false);
                provider.UpdatePQuanProd(prodId:widget.idProd,quantity: quantity,);
              } catch (e) {
                Fluttertoast.showToast(msg: e.toString());
                setState(() {
                  loading = false;
                });
              }
              // doc['qty'] = (int.parse(doc['qty']) - int.parse(quantity.text)).toString();
              clearFields();
              Navigator.pop(context);
            }
              },
            )
          ],
        ),
      ),
    );
  }

  void clearFields() {}
}
