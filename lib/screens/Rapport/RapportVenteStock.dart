import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class RapportVenteStock extends StatefulWidget {
  const RapportVenteStock({Key? key}) : super(key: key);

  @override
  State<RapportVenteStock> createState() => _RapportVenteStockState();
}

class _RapportVenteStockState extends State<RapportVenteStock>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rapport'),
        backgroundColor: Color(0xFF0C8E36),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(
              icon: Text(
                'Ventes',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Tab(
              icon: Text(
                'Achats',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Tab(
              icon: Text(
                'Stock',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          ListRapportVente(),
          ListRapportAppro(),
        ],
      ),
    );
  }
}
