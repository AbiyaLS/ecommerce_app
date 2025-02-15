import 'package:flutter/material.dart';
import '../widget/home_appbar.dart';
import '../widget/search_bar.dart';
import '../widget/silder_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(15.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: HomeAppBar(),
            ),
            SizedBox(height: 10,),
            CustomSearchBar(),
            SizedBox(height: 20,),
            SliderImage(),
          ],
         ),
       ),
     ),


    );
  }
}

// MyButton(text: "logOut", onPressed: ()async{
//   await AuthService().logOut();
//   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
// }),
// SizedBox(height: 20,),
// MyButton(text: "Back to login", onPressed: (){
//   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Login()));
// })