import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class AddGroupProduct extends StatefulWidget {
  const AddGroupProduct({Key? key}) : super(key: key);

  @override
  State<AddGroupProduct> createState() => _AddGroupProductState();
}

class _AddGroupProductState extends State<AddGroupProduct> {

  final name = TextEditingController();

  final _formKey =  GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nouveau groupe de produits'),
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
                  label: 'Nom du groupe des produits',
                  controller: name,
                  textType: TextInputType.name,
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
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ListDeProduitsParGroupe()));
                          //Navigator.of(context).pushNamed(DashboardUser.routeName);
                        },
                        color: Color(0xFF0C8E36),
                        child: Text('Ajouter'),
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
