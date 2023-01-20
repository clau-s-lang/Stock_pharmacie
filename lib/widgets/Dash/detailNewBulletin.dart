import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/screens.dart';

class detailNewBulletin extends StatelessWidget {
  const detailNewBulletin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              width: 250,
              child: Text(
                  'Quel est la meilleure vente effectuée au courant de cette journée ?'),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                MaterialButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailVente()));
                },color: Colors.red,),
                SizedBox(width: 10,),
                Text('data'),
              ],
            ),
          ],
        ),
        Container(
          child: Image(image: AssetImage('images/pharm.PNG'),
            width: 80,
            height: 100,
          ),

        ),
      ],
    );
  }
}
