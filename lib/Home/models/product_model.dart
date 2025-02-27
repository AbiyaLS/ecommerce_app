import 'package:flutter/material.dart';

class Product{
  final String title;
  final String description;
  final String image;
  final double price;
  final String seller;
  final List<Color> color;
  final String category;
  final String review;
  final int quantity;
  final double rate;

  Product({
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.seller,
    required this.color,
    required this.category,
    required this.review,
    required this.quantity,
    required this.rate
});
}
 final List<Product> product = [
   Product(
       title: "Earbuds",
       description: '''Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
   Inventore nesciunt sed animi consectetur eum amet voluptate accusantium iusto harum? Cupiditate a,''',
       image: "assets/products/earbuds.png",
       price: 1200,
       seller: "Arjun Kabir",
       color: [
        Colors.black,
         Colors.blue,
         Colors.white
       ],
       category: "Electronics",
       review: "(320 Reviews)",
       quantity: 1,rate: 4.5),

   Product(
       title: "Mens Jacket",
       description: '''Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
   Inventore nesciunt sed animi consectetur eum amet voluptate accusantium iusto harum? Cupiditate a,''',
       image: "assets/products/jacket.png",
       price: 2200,
       seller: "Arjun Kabir",
       color: [
         Colors.black,
         Colors.blue,
         Colors.red
       ],
       category: "Mens Fashion",
       review: "(320 Reviews)",
       quantity: 1,rate: 4.5),
   Product(
       title: "Shoe",
       description: '''Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
   Inventore nesciunt sed animi consectetur eum amet voluptate accusantium iusto harum? Cupiditate a,''',
       image: "assets/products/shoe.png",
       price: 1200,
       seller: "Arjun Kabir",
       color: [
         Colors.black,
         Colors.blue,
         Colors.white
       ],
       category: "Electronics",
       review: "(320 Reviews)",
       quantity: 1,rate: 4.5),
   Product(
       title: "Sweater",
       description: '''Lorem ipsum dolor sit amet, consectetur adipisicing elit. 
   Inventore nesciunt sed animi consectetur eum amet voluptate accusantium iusto harum? Cupiditate a,''',
       image: "assets/products/sweater.png",
       price: 1200,
       seller: "Arjun Kabir",
       color: [
         Colors.black,
         Colors.blue,
         Colors.white,
         Colors.red,
         Colors.brown,
         Colors.orange

       ],
       category: "Electronics",
       review: "(320 Reviews)",
       quantity: 1,rate: 4.5)
 ];