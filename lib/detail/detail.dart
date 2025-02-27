import 'package:ecommerce_app/Home/models/product_model.dart';
import 'package:ecommerce_app/detail/detail_appbar.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  final Product product;
   Detail({super.key,required this.product});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical:25),
        child: DetailAppbar(),
      ),
    );
  }
}
