import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';


class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final name = TextEditingController();
  final password = TextEditingController();

  final _formKey =  GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  label: 'Nom d\'utilisateur',
                  controller: name,
                  textType: TextInputType.name,
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
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardUser()));
                          //Navigator.of(context).pushNamed(DashboardUser.routeName);
                        },
                        color: Color(0xFF0C8E36),
                        child: Text('Créer un compte'),
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
