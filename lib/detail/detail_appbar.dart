import 'package:flutter/material.dart';

class DetailAppbar extends StatelessWidget {
  const DetailAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: (){
          Navigator.pop(context);
        },
            style: IconButton.styleFrom(backgroundColor: Colors.white),
            icon: Icon(Icons.arrow_back_ios)),
        Spacer(),
        IconButton(onPressed: (){},
            style: IconButton.styleFrom(backgroundColor: Colors.white),
            icon: Icon(Icons.share,size: 25,)),
        SizedBox(width: 10,),
        IconButton(onPressed: (){},
            style: IconButton.styleFrom(backgroundColor: Colors.white),
            icon: Icon(Icons.favorite_border_outlined,size: 25,))
      ],
    );
  }
}
