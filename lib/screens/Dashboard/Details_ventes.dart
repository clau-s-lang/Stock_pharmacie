import 'package:flutter/material.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class DetailVente extends StatefulWidget {
  const DetailVente({Key? key}) : super(key: key);

  @override
  State<DetailVente> createState() => _DetailVenteState();
}

class _DetailVenteState extends State<DetailVente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Commission personnel'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Aujourd\'hui', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                Text('PLUS',)
              ],
            ),
            SizedBox(height: 15,),
            Card_detail_vente(),
          ],
        ),
      ),
    );
  }
}

