import 'package:flutter/material.dart';

class AddGroupProducts extends StatefulWidget {

  static const String routeName = '/AddGroupProducts';

  const AddGroupProducts({Key? key}) : super(key: key);


  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (context) => AddGroupProducts());
  }

  @override
  State<AddGroupProducts> createState() => _AddGroupProductsState();
}

class _AddGroupProductsState extends State<AddGroupProducts> {
  @override
  Widget build(BuildContext context) {
    return ListView(

    );
  }
}
