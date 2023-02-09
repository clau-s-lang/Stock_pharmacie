import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:stock_pharma/models/models.dart';
import 'package:stock_pharma/screens/Dashboard/edit_product.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';
import '../../provider/provider/apiProvider.dart';
import '../../utils/Loading/loading.dart';

class ApprovisionementPage extends StatefulWidget {
  const ApprovisionementPage({Key? key}) : super(key: key);

  @override
  State<ApprovisionementPage> createState() => _ApprovisionementPageState();
}

class _ApprovisionementPageState extends State<ApprovisionementPage> {

  final dateDachat = TextEditingController();
  final status = TextEditingController();
  final quantity = TextEditingController();
  /*final fournisseur = TextEditingController();
  final description = TextEditingController();*/

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
          padding:
          const EdgeInsets.only(left: 15.0, right: 15, top: 60, bottom: 10),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Column(
                  children: [
                    Card(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Card(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(top: 80, left: 10, right: 10),
                              child: Form(
                                key: _formKey,
                                child: Nom_produit(name: dateDachat),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                child: Container(
                                  height: 60,
                                  width: 150,
                                  child: employTextField(
                                    height: 50,
                                    width: 100,
                                    label: 'Status',
                                    controller: status,
                                  ),

                                ),
                              ),
                              Card(
                                child: Container(
                                  height: 60,
                                  width: 150,
                                  child: employTextField(
                                    height: 50,
                                    width: 100,
                                    label: 'Quantité',
                                    controller: quantity,
                                  ),

                                ),
                              ),
                            ],
                          ),
                          /*Card(
                            child: Container(
                              width: 300,
                              height: 60,
                              child: employTextField(
                                label: 'Fournisseur',
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              width: 300,
                              height: 60,
                              child: employTextField(
                                label: 'Description',
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              width: 300,
                              height: 60,
                              child: employTextField(
                                label: 'Date d\'expiration',
                              ),
                            ),
                          ),
*/
                        ],
                      ),

                    ),

                  ],
                ),
              ),
              Positioned(
                top: -10,
                //bottom: 100,
                left: 120,
                child: Container(
                  height: 85,
                  width: 85,
                  child: Card(
                    color: Colors.white70,
                    child: Icon(Icons.image, color: Colors.grey,),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            try {
              setState(() {
                loading = true;
              });
              final appro = Approvisionement(
                dateAchat:dateDachat.text,
                status: status.text,
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
        child: Icon(Icons.check),
        backgroundColor:Color(0xFF0C8E36) ,
      ),
    );
  }

  void clearFields() {
    dateDachat.clear();
    status.clear();
    quantity.clear();
  }
}

