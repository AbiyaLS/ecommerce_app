import 'package:ecommerce_app/auth/components/showSnackBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword>with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize AnimationController with a faster duration
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000),
      // Reduced duration for faster animation
      vsync: this,
    );
    // Slide animations (sliding from slightly to the right)
    _slideAnimation =
        Tween<Offset>(begin: Offset(0.3, 0.1), end: Offset.zero).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeIn),
        );
    // Fade animations (fade from 0 to 1)
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final TextEditingController _emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: InkWell(
          onTap: () {
            myDialogBox(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Forget Password?",
                  style: TextStyle(color: Color(0xFF3D3BF3)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void myDialogBox(BuildContext context) {
    showDialog(context: context, builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Forgot Your Password", style: TextStyle(fontSize: 18),),
                  IconButton(onPressed: () {
                    Navigator.pop(context);
                  }, icon: Icon(Icons.clear)),
                ],
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),),
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF3D3BF3)),
                  onPressed: () async{
                await auth.sendPasswordResetEmail(email: _emailController.text).then((value){
                  //if successfull then show this message
                  showSnackBar(context, "We have send the reset password link to your email id, Please check it!");
                }).onError((error,stackTrace){
                  //if not successfull then show this message
                  showSnackBar(context, error.toString());
                });
                Navigator.pop(context);
                _emailController.clear();
                  },
                  child: Text("Send", style: TextStyle(color: Colors.white),))

            ],
          ),
        ),
      );
    });
  }
}
