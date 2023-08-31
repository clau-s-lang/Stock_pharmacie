import 'package:flutter/material.dart';

class Entete_Dash extends StatelessWidget {
  const Entete_Dash({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Status financier',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    'Hebdomadaire',
                    style: TextStyle(color: Colors.green),
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.green,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
