import 'package:flutter/material.dart';

class Card_detail_vente extends StatelessWidget {
  const Card_detail_vente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(child: Icon(Icons.bike_scooter),),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Paracetamol', style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text('2022-02-23 11:03pm', )
              ],),
          ],
        ),
        Text('-13.24', style: TextStyle(color: Colors.indigo),),
      ],
    );
  }
}
