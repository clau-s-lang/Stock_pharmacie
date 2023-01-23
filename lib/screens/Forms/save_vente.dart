import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class Save_sales extends StatefulWidget {

  Save_sales({Key? key}) : super(key: key);

  @override
  State<Save_sales> createState() => _Save_salesState();

}

class _Save_salesState extends State<Save_sales> {

  final designation = TextEditingController();
  final quantity = TextEditingController();
  final formePharma = TextEditingController();
  final date = TextEditingController();
  final observation = TextEditingController();

  final _formKey =  GlobalKey<FormState>();

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
                /*employTextField(
                  width: 330,
                  controller: designation,
                  label: 'Nom du produit',
                  hint: 'Veuillez entrer le nom du produit',
                ),*/
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
                  controller: observation,
                  label: 'Observation',
                  hint: 'Donnez une observation',
                ),
                Row(
                  children: [
                    Expanded(
                      child: MaterialButton(
                        height: 30,
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        textColor: Colors.white,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardUser()));
                          //Navigator.of(context).pushNamed(DashboardUser.routeName);
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
}

