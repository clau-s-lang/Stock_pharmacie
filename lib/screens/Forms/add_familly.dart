import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class AddFamilly extends StatefulWidget {

  AddFamilly({Key? key}) : super(key: key);

  @override
  State<AddFamilly> createState() => _AddFamillyState();

}

class _AddFamillyState extends State<AddFamilly> {

  final nom = TextEditingController();
  final phone = TextEditingController();
  final adresse = TextEditingController();
  final date = TextEditingController();
  final observation = TextEditingController();

  final _formKey =  GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter une famille'),
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
                  controller: nom,
                  label: 'Nom de la famille',
                  hint: 'Veuillez entrer le nom de la famille',
                ),
                employTextField(
                  width: 330,
                  controller: phone,
                  label: 'Numero de téléphone',
                  hint: 'Veuillez entrer le numero de téléphone',
                ),
                employTextField(
                  width: 330,
                  controller: adresse,
                  label: 'Adresse du client',
                  hint: 'Entrez l\'adresse du client',
                ),
                Container(
                  width: 330,
                  child: TextFormField(
                    controller: date,
                    style: TextStyle(
                      fontSize: 15,
                      height: 0.5,
                    ),
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
                          date.text = formattedDate;
                        });
                      } else {
                        snackBarWidget(context,
                            message: "La date n'est pas selectioné");
                      }
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date d\'enregistrement',
                        hintText: 'Veuillez selectionner la date'
                    ),
                  ),
                ),
                employTextField(
                  width: 330,
                  controller: date,
                  label: 'Date d\'enregistrement',
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
                        padding: EdgeInsets.all(15.0),
                        textColor: Colors.white,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>RapportVenteStock()));
                          //Navigator.of(context).pushNamed(DashboardUser.routeName);
                        },
                        color: Color(0xFF0C8E36),
                        child: Text('Ajouter une famille'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
