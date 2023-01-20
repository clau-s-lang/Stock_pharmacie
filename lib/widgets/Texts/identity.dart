import 'package:flutter/material.dart';

class IdentitySeller extends StatelessWidget {
  const IdentitySeller({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Anita Judith',
              style:
              TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            Text('En charge de la caisse'),
          ],
        ),
        CircleAvatar(),
      ],
    );
  }
}
