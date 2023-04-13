import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:stock_pharma/models/models.dart';

import '../../provider/provider/apiProvider.dart';

class ModifierProduitExp extends StatefulWidget {
  final String idProd;
  final String nom;
  final String uniteMesure;
  final String category;
  String dateExp;
  final String formePharm;
  late final String prix;
  String qty;

  ModifierProduitExp({
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
  State<ModifierProduitExp> createState() => _ModifierProduitExpState();
}

class _ModifierProduitExpState extends State<ModifierProduitExp> {
  late String DateExp;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  void initState() {
    super.initState();
    DateExp = widget.dateExp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier la date d\'expiration de' + ' ' + widget.nom),
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
              initialValue: widget.dateExp.toString(),
              decoration: InputDecoration(
                  label: Text('Nouvelle date d\'expiration'),
                  hintText: 'Saisir le nouvelle date d\'expiration'),
              validator: (e) => e!.isEmpty ? 'veuillez remplir le champ' : null,
              onChanged: (e) => DateExp = e,
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
                      widget.dateExp = DateExp.toString();
                      try {
                        setState(() {
                          loading = true;
                        });
                        final dateExp = DateExp;
                        final provider =
                        Provider.of<ProviderApi>(context, listen: false);
                        provider.UpdateDateExpProduit(prodId:widget.idProd,date: dateExp,);
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
