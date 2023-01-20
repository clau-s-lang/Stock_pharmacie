import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/screens.dart';

class Materialbutton extends StatelessWidget {
  const Materialbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MaterialButton(
            height: 30,
            padding: EdgeInsets.all(15.0),
            textColor: Colors.white,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFamilly()));
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
    );
  }
}

