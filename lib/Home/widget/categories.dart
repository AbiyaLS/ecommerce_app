import 'package:ecommerce_app/Home/models/categories_model.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context,index){
          return Column(
            children: [
              Container(
                height: 55,
                  width: 65,
                decoration: BoxDecoration(
                  shape:BoxShape.circle,
                  image: DecorationImage(image: AssetImage(categories[index].image),fit: BoxFit.fill)
                ),
              ),
              SizedBox(height: 5,),
              Text(categories[index].title)
            ],
          );
          },
        separatorBuilder: (context,index)=>SizedBox(width: 20,)
      ),
    );
  }
}


