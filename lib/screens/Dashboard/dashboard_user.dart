import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/Dashboard/dashboard_product.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class DashboardUser extends StatefulWidget {
  const DashboardUser({Key? key}) : super(key: key);

  @override
  State<DashboardUser> createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBarDashUser(),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                children: [
                  dashUserTile(
                      text: 'Produits',
                      //routing: Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardProduct(),
                      //))
    ),
                  //Navigator.pushNamed(context, DashUserProduct.routeName)
                  dashUserTile(
                    text: 'Ventes',
                  ),
                ],
              ),
              Row(
                children: [
                  dashUserTile(
                    text: 'Dettes client',
                  ),
                  dashUserTile(
                    text: 'Occasionnelles',
                  ),
                ],
              ),
              Row(
                children: [
                  dashUserTile(
                    text: 'Rapports',
                  ),
                  dashUserTile(
                    text: 'Ventes',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color(0xFF0C8E36),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardProduct(),
          ));
        },
        //Icon(Icons.add),
      ),
    );
  }
}
