import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/screens.dart';
import 'package:stock_pharma/widgets/widgets.dart';

class DashboardUser extends StatefulWidget {
  static const String routeName = '/DashboardUser';
  const DashboardUser({Key? key}) : super(key: key);
  static Route route() {
    return  MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => DashboardUser());
  }
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
                    routing: Navigator.pushNamed(context, DashUserProduct.routeName)
                  ),
                 /* dashUserTile(
                    text: 'Ventes',
                  ),*/
                ],
              ),
             /* Row(
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
              ),*/
            ],
          ),
        ],
      ),
    );
  }
}

