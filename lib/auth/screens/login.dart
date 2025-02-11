import 'package:ecommerce_app/auth/components/auth_textfield.dart';
import 'package:ecommerce_app/auth/components/divider.dart';
import 'package:ecommerce_app/auth/screens/signUp.dart';
import 'package:ecommerce_app/auth/services/authService.dart';
import 'package:flutter/material.dart';

import '../../homePage.dart';
import '../components/myButton.dart';
import '../components/showSnackBar.dart';
import '../components/squareTile.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
class _LoginState extends State<Login> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation1, _slideAnimation2;
  late Animation<double> _fadeAnimation1, _fadeAnimation2;
  @override
  void initState() {
    super.initState();
    // Initialize AnimationController with a faster duration
    _controller = AnimationController(
      duration: Duration(milliseconds: 1000), // Reduced duration for faster animation
      vsync: this,
    );
    // Slide animations (sliding from slightly to the right)
    _slideAnimation1 = Tween<Offset>(begin: Offset(0.3, 0.1), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _slideAnimation2 = Tween<Offset>(begin: Offset(0.1, 0), end: Offset.zero).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    // Fade animations (fade from 0 to 1)
    _fadeAnimation1 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _fadeAnimation2 = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.reset();
    _controller.forward();
  }
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  //login Function
  void loginUser(BuildContext context) async {
    String res = await AuthService().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
      context: context, // Pass context here
    );
    if (res == "success") {
      setState(() {
        isLoading = true;
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, res);
    }
  }
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/splash.jpg",
              height: screenHeight,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.grey.withOpacity(0.4),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: screenHeight/ 1.8,
              width: screenWidth,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 20,
                      blurRadius: 30,
                      color: Colors.white.withOpacity(0.8),
                      offset: Offset(0, -6))
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FadeTransition(
                      opacity: _fadeAnimation1,
                      child: SlideTransition(
                        position: _slideAnimation1,
                        child: Text(
                          "ShopX",
                          style: TextStyle(
                              color: Color(0xFF3D3BF3),
                              fontWeight: FontWeight.w900,
                              fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    FadeTransition(
                      opacity: _fadeAnimation2,
                      child: SlideTransition(
                        position: _slideAnimation2,
                        child: Text(
                          "One Shop Solution for All Your Needs",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    AuthTextField(
                      controller: _emailController,
                      hintText: "Email",
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    AuthTextField(
                      controller: _passwordController,
                      hintText: "Password",
                      obscureText: true,
                    ),
                    // SizedBox(height: 10),
                    FadeTransition(
                      opacity: _fadeAnimation2,
                      child: SlideTransition(
                        position: _slideAnimation2,
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
                    const SizedBox(height: 5),
                    GestureDetector(
                      child: MyButton(
                        onPressed: ()=>loginUser(context),
                        text: "Login",
                      ),
                    ),
                    const SizedBox(height: 15),
                     DividerText(thickness: 0.8, color: Colors.grey),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SquareTile(imagePath: "lib/auth/icons/google.png",),
                        SizedBox(width: 10,),
                        SquareTile(imagePath: "lib/auth/icons/apple.png",)
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Not a member?"),
                        SizedBox(width: 5),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                          },
                          child: Text(
                            "Register Now",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF3D3BF3),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
