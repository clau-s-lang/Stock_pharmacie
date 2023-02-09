import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:stock_pharma/models/models.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/utils/utils.dart';
import 'package:stock_pharma/widgets/widgets.dart';

import '../../provider/provider/apiProvider.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phone = TextEditingController();

  bool loading = false;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              title: Text('Nouvel utilisateur'),
              backgroundColor: Color(0xFF0C8E36),
            ),
            body: ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              children: [
                Center(
                  child: Container(
                    child: Image(
                      image: AssetImage('images/pharm.PNG'),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      employTextField(
                        label: 'Nom d\'utilisateur',
                        controller: name,
                        textType: TextInputType.name,
                      ),
                      employTextField(
                        label: 'Email',
                        controller: email,
                        textType: TextInputType.emailAddress,
                      ),
                      employTextField(
                        label: 'Numero de telephoe',
                        controller: phone,
                        textType: TextInputType.emailAddress,
                      ),
                      employTextField(
                        label: 'Mot de passe',
                        controller: password,
                        textType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: MaterialButton(
                              height: 30,
                              padding: EdgeInsets.all(15.0),
                              textColor: Colors.white,
                              onPressed: () async {
                                //Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardUser()));
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  try {
                                    setState(() {
                                      loading =true;
                                    });
                                    final employ = Employee(
                                      name: name.text,
                                      email: email.text,
                                      password: password.text,
                                      phone: phone.text,
                                    );

                                    final provider = Provider.of<ProviderApi>(
                                        context,
                                        listen: false);
                                    provider.signUpWithEmail(
                                        email: email.text,
                                        password: password.text,
                                        employee: employ);
                                  } catch (e) {
                                    Fluttertoast.showToast(msg: e.toString());
                                    setState(() {
                                      loading = false;
                                    });
                                  }
                                  clearFields();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DashboardUser()));
                                }
                              },
                              color: Color(0xFF0C8E36),
                              child: Text('Créer un compte'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
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

  void clearFields() {
    name.clear();
    phone.clear();
    email.clear();
    password.clear();
  }
}
