import 'package:flutter/material.dart';

class iconeOptions extends StatelessWidget {
  const iconeOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            CircleAvatar(
              child: Icon(
                Icons.message,
                color: Colors.black,
              ),
              backgroundColor: Colors.white10,
            ),
            Text('Message')
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              child: Icon(
                Icons.add_card,
                color: Colors.black,
              ),
              backgroundColor: Colors.white10,
            ),
            Text('Signes')
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              child: Icon(
                Icons.camera_alt_rounded,
                color: Colors.black,
              ),
              backgroundColor: Colors.white10,
            ),
            Text('Photo')
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              child: Icon(
                Icons.ac_unit_sharp,
                color: Colors.black,
              ),
              backgroundColor: Colors.white10,
            ),
            Text('Collection'),
          ],
        ),
      ],
    );
  }
}

