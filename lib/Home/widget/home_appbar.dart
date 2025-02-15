import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: (){},
            style: IconButton.styleFrom(backgroundColor: Colors.grey.shade200),
            icon: Image.asset("lib/Home/icons/menu.png",height: 25,)),
        IconButton(onPressed: (){},
            style: IconButton.styleFrom(backgroundColor: Colors.grey.shade200),
            icon: Icon(Icons.notifications_active_outlined,size: 25,))
      ],
    );
  }
}
