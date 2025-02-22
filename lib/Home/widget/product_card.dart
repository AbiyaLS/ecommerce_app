import 'package:ecommerce_app/Home/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200,
          ),
          child: Column(
            children: [
              // SizedBox(height: 10,),
                Center(child: Image.asset(product.image,width: 130,height: 130,fit: BoxFit.fill,),),
              // SizedBox(height: 5,),
              Text(product.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SizedBox(width: 2,),
                  Text("\$${product.price}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Row(
                    children:
                      List.generate(
                      product.color.length,
                      (index)=>Container(height: 15,width: 15,
                      decoration: BoxDecoration(color: product.color[index],shape: BoxShape.circle),))
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
