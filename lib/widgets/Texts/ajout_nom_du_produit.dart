import 'package:flutter/material.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class Nom_produit extends StatelessWidget {
  const Nom_produit({
    Key? key,
    required this.name,
  }) : super(key: key);

  final TextEditingController name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          encoloredTextField(
            width: 200,
            height: 50,
            label: 'Nom du produit',
            controller: name,
            textType: TextInputType.name,
          ),
        ],
      ),
    );
  }
}
