import 'package:ecommerce_app/auth/components/myButton.dart';
import 'package:ecommerce_app/auth/screens/login.dart';
import 'package:ecommerce_app/auth/services/authService.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        leading:IconButton(onPressed: (){}, icon: Icon(Icons.menu),),
        actions: [
          Row(children: [ IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none)),SizedBox(width: 5,)]),
        ],),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),borderRadius: BorderRadius.circular(40)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                  ),
                  fillColor: Colors.grey.shade200,filled: true,
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  hintText: "Search "
              ),
            ),
          ),
          MyButton(text: "logOut", onPressed: ()async{
            await AuthService().logOut();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
          }),
          SizedBox(height: 20,),
          MyButton(text: "Back to login", onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
          })
        ],
      ),
    );
  }
}