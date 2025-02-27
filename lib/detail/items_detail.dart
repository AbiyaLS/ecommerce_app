import 'package:flutter/material.dart';

import '../Home/models/product_model.dart';

class ItemsDetail extends StatelessWidget {
  final Product product;
  const ItemsDetail({super.key,required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.title,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("\$${product.price}",style: TextStyle(fontSize: 20),),
                Row(
                  children: [
                    Container(width:65,height:25,decoration: BoxDecoration(color: Color(0xFF3D3BF3),borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.star,color: Colors.white,size: 20,),SizedBox(width: 5,),Text(product.rate.toString(),style: TextStyle(color: Colors.white,fontSize: 18),
                          ),
                          ],
                        )),SizedBox(width: 5,),
                    Text(product.review,style: TextStyle(color: Colors.grey,fontSize: 20),)
                  ],
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Text("Seller : ",style: TextStyle(color: Colors.grey,fontSize: 16),),
                Text(product.seller,style: TextStyle(color: Colors.black,fontSize: 18),)
              ],
            )
          ],
        ),
SizedBox(height: 5,),
Text("Color",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Row(
            children:
            List.generate(
                product.color.length,
                    (index)=>GestureDetector(onTap: (){},
                    child: AnimatedContainer(duration: Duration(milliseconds: 300),height: 35,width: 35,decoration: BoxDecoration(
                      border:
                    ),),)
            )
        )
      ],
    );
  }
}
