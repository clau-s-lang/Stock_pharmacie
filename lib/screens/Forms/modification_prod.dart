import 'package:flutter/material.dart';

class ModifierProduitNombre extends StatefulWidget {
  final String idProd;
  final String nom;
   String Nombre;

  ModifierProduitNombre(
      {Key? key, required this.idProd, required this.Nombre, required this.nom})
      : super(key: key);

  @override
  State<ModifierProduitNombre> createState() => _ModifierProduitNombreState();
}

class _ModifierProduitNombreState extends State<ModifierProduitNombre> {
  late String nombre;
  final _formKey = GlobalKey<FormState>();

  void initState() {
    super.initState();
    nombre = widget.Nombre;
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
              initialValue: widget.Nombre,
              decoration: InputDecoration(
                  label: Text('Nouvelle quantité'),
                  hintText: 'Saisir la nouvelle quantité'),
              validator: (e) => e!.isEmpty ? 'veuillez remplir le champ' : null,
              onChanged: (e) => nombre = e,
            ),
            Expanded(
                child: MaterialButton(
                  height: 30,
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
                  textColor: Colors.white,
                  color: Color(0xFF0C8E36),
                  child: Text('Enregister la modification'),
              onPressed: () async {
                    if(_formKey.currentState!.validate()){
                      widget.Nombre = nombre;
                    }
              },
            ))
          ],
        ),
      ),
    );
  }
}
