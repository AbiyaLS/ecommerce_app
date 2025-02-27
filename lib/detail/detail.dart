import 'package:ecommerce_app/Home/models/product_model.dart';
import 'package:ecommerce_app/detail/detail_appbar.dart';
import 'package:ecommerce_app/detail/image_slider.dart';
import 'package:ecommerce_app/detail/items_detail.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final Product product;
   Detail({super.key,required this.product});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int currentImage=0;
  int currentSlide =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:25),
            child: DetailAppbar(),),
          ImageSlider(image:widget.product.image, onChange: (index){
            setState(() {
              currentImage =index;
            });
          }),
          SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:List.generate(5, (index)=>AnimatedContainer(duration: const Duration(microseconds: 300),
            width: currentSlide ==index ? 15 : 8,
            height: 8,
            margin: EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentSlide ==index ? Colors.black : Colors.transparent,
              border: Border.all(color: Colors.black)
            ),
            ))
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30),topLeft: Radius.circular(30)),
            ),
            padding: EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 130),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ItemsDetail(product: widget.product),
              ],
            ),
          )
        ],
      ),
    );
  }
}
