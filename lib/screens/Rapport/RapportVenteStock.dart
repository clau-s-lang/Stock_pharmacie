

import 'package:flutter/material.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class RapportVenteStock extends StatefulWidget {
  const RapportVenteStock({Key? key}) : super(key: key);

  @override
  State<RapportVenteStock> createState() => _RapportVenteStockState();
}

class _RapportVenteStockState extends State<RapportVenteStock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rapport'),
        backgroundColor: Color(0xFF0C8E36),
      ),
      body: ListView(
        children: [
          Entete_budget(),
          DetailRapport(),
          DetailRapport(),
          DetailRapport(),
          DetailRapport(),
        ],
      ),
    );
  }
}
