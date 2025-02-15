import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderImage extends StatefulWidget {
  const SliderImage({super.key});

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  int _currentIndex = 0;
  final List<String> imagePaths = [
    "assets/slider_image/image1.png",
    "assets/slider_image/image2.png",
    "assets/slider_image/image3.png",
    "assets/slider_image/image4.png",
    "assets/slider_image/image5.png",
    "assets/slider_image/image6.png"
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeight = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: screenHeight * 0.3,
          width: double.infinity,
          child: CarouselSlider(
            items: imagePaths.map((path) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(20), // Circular Border
                child: Image.asset(
                  path,
                  fit: BoxFit.fill,
                  width: screenWeight*5,
                ),
              );
            }).toList(),
            options: CarouselOptions(
              height: screenHeight * 0.35,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 10),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                setState(() => _currentIndex = index);
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            imagePaths.length,
                (index) => Container(
              margin: EdgeInsets.all(4),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index ? Colors.black45 : Colors.grey.shade200,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
