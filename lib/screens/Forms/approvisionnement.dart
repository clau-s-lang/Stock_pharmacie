import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stock_pharma/models/models.dart';
import 'package:stock_pharma/widgets/widgets.dart';
import '../../provider/provider/apiProvider.dart';
import '../../utils/Loading/loading.dart';

class ApprovisionementPage extends StatefulWidget {
  final String productId;
   ApprovisionementPage({Key? key, required this.productId}) : super(key: key);

  @override
  State<ApprovisionementPage> createState() => _ApprovisionementPageState();
}

class _ApprovisionementPageState extends State<ApprovisionementPage> {

  final dateDachat = TextEditingController();
  final dateExpiration = TextEditingController();
  final prixAchat = TextEditingController();
  final quantity = TextEditingController();
  final fournisseur = TextEditingController();
  final typePaiement = TextEditingController();
  final _formKey =  GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        :Scaffold(
      appBar: AppBar(
        title: Text('Nouvel approvisionement'),
        backgroundColor: Color(0xFF0C8E36),
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              employTextField(
                label: 'Prix d\'achat',
                controller: prixAchat,
              ),
              employTextField(
                label: 'Quantité',
                controller: quantity,
              ),
              employTextField(
                label: 'Fournisseur',
                controller: fournisseur,
              ),
              employTextField(
                label: 'Type de paiement',
                controller: typePaiement,
              ),
              SizedBox(height: 10,),
              Container(
                child: TextFormField(
                  controller: dateExpiration,
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
                        dateExpiration.text = formattedDate;
                      });
                    } else {
                      snackBarWidget(context,
                          message: "La date n'est pas selectioné");
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.green, style: BorderStyle.solid, width: 1.0),
                      ),
                      labelText: 'Date d\'expiration',
                      hintText: 'Veuillez selectionner la date'
                  ),
                ),
              ),
             
            ],
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
              final appro = Approvisionement(
                dateAchat:dateDachat.text,
                status: prixAchat.text,
                qty: quantity.text,
              );
              final provider = Provider.of<ProviderApi>(context,
                  listen: false);
              provider.approv(appro: appro);
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
    dateDachat.clear();
    prixAchat.clear();
    quantity.clear();
  }
}

