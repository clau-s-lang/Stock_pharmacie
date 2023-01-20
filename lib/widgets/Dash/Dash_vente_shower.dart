import 'package:flutter/material.dart';

class DashVenteShower extends StatelessWidget {
  const DashVenteShower({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.indigo,
          ),
          height: 100,
          width: 90,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Performances',
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
                Text('2850\$',
                    style: TextStyle(color: Colors.white, fontSize: 20))
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.deepOrangeAccent,
          ),
          height: 100,
          width: 90,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bénéfices',
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
                Text(
                  '126',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.amberAccent,
          ),
          height: 100,
          width: 90,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Achats',
                  style: TextStyle(color: Colors.white, fontSize: 8),
                ),
                Text('2850\$',
                    style: TextStyle(color: Colors.white, fontSize: 20))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

