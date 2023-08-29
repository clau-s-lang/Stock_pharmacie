import 'package:flutter/material.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class VenteJournalier extends StatefulWidget {
  const VenteJournalier({Key? key}) : super(key: key);

  @override
  State<VenteJournalier> createState() => _VenteJournalierState();
}

class _VenteJournalierState extends State<VenteJournalier> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Les ventes journalieres'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            IdentitySeller(),
            SizedBox(
              height: 20,
            ),
            DashVenteShower(),
            SizedBox(
              height: 15,
            ),
            iconeOptions(),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nouveau bulletin',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 15,
                ),
                detailNewBulletin(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


