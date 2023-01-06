import 'package:flutter/material.dart';

class AppBarDashUser extends StatelessWidget {
  const AppBarDashUser({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.format_align_left_outlined,
        color: Colors.white,
      ),
      backgroundColor: Color(0xFF0C8E36),
      actions: [
        Container(padding: EdgeInsets.all(10), child: CircleAvatar()),
      ],
      flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 50),
            color: Color(0xFF0C8E36),
            child: Column(
              children: [
                Text(
                  'Tableau de bord',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Dernière mise à jour, 25 Fev 2023',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
