import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  const DividerText({super.key, required double thickness, required MaterialColor color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
              child: Divider(
                 thickness :0.5,
                color: Colors.grey
              ),
          ),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text("Or continue with"),),
          Expanded(
            child: Divider(
                thickness :0.5,
                color: Colors.grey
            ),
          ),
        ],
      ),
    );
  }
}
