import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final Function (int) onChange;
  final String image;
   ImageSlider({super.key,required this.image,required this.onChange});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight/2.5,
        child: PageView.builder(itemBuilder: (context,index){
          return Image.asset(image,fit: BoxFit.contain);
        }),
    );
  }
}
