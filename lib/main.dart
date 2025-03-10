import 'package:ecommerce_app/Home/widget/bottam_nav.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Home/screens/homePage.dart';
import 'auth/screens/login.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(), builder: (context,snapshot){
     //   if(snapshot.hasData){
     //     return HomePage();
     //   }
     //   else{
     //     return Login();
     //   }
     // }),
      home: BottomNav(),
    );
  }
}
