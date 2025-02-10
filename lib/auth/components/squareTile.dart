
import 'package:flutter/material.dart';

class SquareTile extends StatefulWidget {
  final String imagePath;
  SquareTile({super.key,required this.imagePath});

  @override
  State<SquareTile> createState() => _SquareTileState();
}
class _SquareTileState extends State<SquareTile>with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1.0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward(); // Start animation
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              border: Border.all(color:Colors.white),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Image.asset(widget.imagePath,height: 40,),
        ),
      ),
    );
  }
}
