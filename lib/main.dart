import 'package:flutter/material.dart';
import 'package:stock_pharma/config/router.dart';
import 'package:stock_pharma/screens/dashboards/dashboard_user.dart';
import 'package:stock_pharma/screens/forms/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF00A34D),
      ),
      onGenerateRoute: AppRouter.onGeneratedRoute,
      initialRoute: SignUp.routeNameS,
    );
  }
}


