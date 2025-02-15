import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(40),
      ),
      padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: Row(
        children: [
          Icon(Icons.search,color: Colors.black38,),
          SizedBox(width: 10,),
          Flexible(flex: 4,
              child: TextField(
                decoration: InputDecoration(hintText: "Search...",border: InputBorder.none),)),
          Container(height: 30,width: 1.5,color: Colors.grey,),
          IconButton(onPressed: (){}, icon: Icon(Icons.tune,color: Colors.black38,))
        ],
      ),
    );
  }
}
