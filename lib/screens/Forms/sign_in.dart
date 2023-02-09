import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/utils/utils.dart';
import 'package:stock_pharma/widgets/widgets.dart';
import '../../provider/provider/apiProvider.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final email = TextEditingController();
  final password = TextEditingController();

  final _formKey =  GlobalKey<FormState>();
  bool isVisible = true;
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return loading ? Loading(): Scaffold(
      appBar: AppBar(
        title: Text('Se contacter'),
        backgroundColor: Color(0xFF0C8E36),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        children: [
          Center(
            child: Container(
              child: Image(image: AssetImage('images/pharm.PNG'),),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                employTextField(
                  label: 'Email',
                  controller: email,
                  textType: TextInputType.name,
                ),
                Container(
                  width: 330,
                  child: TextFormField(
                    controller: password,
                    style: TextStyle(
                      fontSize: 15,
                      height: 0.5,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Obligatoire';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isVisible,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: Icon(!isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Mot de passe',
                      hintText: 'Completer votre mot de passe',
                    ),
                  ),
                ),
                /*employTextField(
                  label: 'Mot de passe',
                  controller: password,
                  textType: TextInputType.visiblePassword,
                ),*/
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
                        onPressed: (){
                          if(_formKey.currentState!.validate()){
                            setState(() {
                              loading = true;
                            });
                            final provider =
                            Provider.of<ProviderApi>(context, listen: false);
                            provider.signInWithEmail(
                              email: email.text,
                              password: password.text,
                            );
                          }
                          else{
                            loading = false;
                          }
                          Center(
                            child: CircularProgressIndicator(),
                          );
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardUser()));
                        },
                        color: Color(0xFF0C8E36),
                        child: Text('Se connecter'),
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
