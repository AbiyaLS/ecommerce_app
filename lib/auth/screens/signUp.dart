import 'package:ecommerce_app/auth/screens/login.dart';
import 'package:flutter/material.dart';

import '../../homePage.dart';
import '../components/auth_textfield.dart';
import '../components/divider.dart';
import '../components/myButton.dart';
import '../components/showSnackBar.dart';
import '../components/squareTile.dart';
import '../services/authService.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  //Sign Up function
  void signUp(BuildContext context) async {
    String res = await AuthService().signUpWithEmailPassword(
      name: _nameController.text,
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
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.8),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 80),
            Image.asset("lib/auth/icons/login.png", fit: BoxFit.fill, height: 100),
            const Center(
              child: Text(
                "Welcome back, you've been missed!",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),
            AuthTextField(
              controller: _nameController,
              hintText: "Name",
              obscureText: false,
            ),
            const SizedBox(height: 10),
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

            const SizedBox(height: 15),
            MyButton(
              text: "Sign Up",
              onPressed: () => signUp(context),  // Call signUp method
            ),
            const SizedBox(height: 50),
            DividerText(thickness: 0.8, color: Colors.grey),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SquareTile(imagePath: "lib/auth/icons/google.png"),
                const SizedBox(width: 10),
                SquareTile(imagePath: "lib/auth/icons/apple.png")
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                  },
                  child: const Text(
                    "Sign In",
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
    );
  }
}