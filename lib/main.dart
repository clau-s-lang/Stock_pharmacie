import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_pharma/provider/provider/apiProvider.dart';
import 'package:stock_pharma/screens/screens.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //print(FirebaseAuth.instance.currentUser!.uid);
    return ChangeNotifierProvider(
      create: (context) => ProviderApi(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF00A34D),
        ),
        home:Wrapper(),
      ),
    );
  }
}


