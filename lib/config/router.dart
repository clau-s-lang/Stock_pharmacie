import 'package:flutter/material.dart';
import 'package:stock_pharma/screens/screens.dart';

class AppRouter{
  static Route onGeneratedRoute(RouteSettings settings){
    print(settings.name);
    switch (settings.name){
      case SignUp.routeNameS :
        return SignUp.route();
      case DashboardUser.routeName :
        return DashboardUser.route();
      case DashUserProduct.routeName :
        return DashUserProduct.route();
      case AddGroupProducts.routeName:
        return AddGroupProducts.route();
      default:
        return _errorRoute();
    }
  }
  static _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(),
      settings: RouteSettings(name: '/error'),
    );
  }
}