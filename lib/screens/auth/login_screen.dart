// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:buybuzz/screens/auth/auth_util/square_tile.dart';
import 'package:buybuzz/screens/auth/auth_util/textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final void Function()? onTap;

  LoginScreen({super.key, required, this.onTap});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void login(BuildContext context) {}

  Widget topWidget(double screenWidth) {
    return Transform.rotate(
      angle: -35,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            gradient: LinearGradient(
              begin: Alignment(-0.2, -0.8),
              end: Alignment.bottomCenter,
              colors: const [
                Color(0x007CBFCF),
                Color.fromARGB(255, 49, 150, 233)
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Stack(children: [
          Positioned(top: -160, left: -30, child: topWidget(screenSize.width)),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '🔥BUYBUZZ',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Text("Please enter your email address",
                        style:
                            TextStyle(fontWeight: FontWeight.w200, fontSize: 18)),
                    Text("and enter password",
                        style:
                            TextStyle(fontWeight: FontWeight.w200, fontSize: 18))
                  ],
                ),
                SizedBox(height: 10),
                // MyTextField(hintText: 'Full name', obscureText: true, controller: _nameController),
                MyTextField(
                  hintText: 'Enter your email',
                  obscureText: false,
                  controller: _emailController,
                  icon: Icon(
                    Icons.email_outlined,
                    color: Colors.black26,
                  ),
                ),
                SizedBox(height: 15),
                MyTextField(
                  hintText: 'Enter your password',
                  obscureText: true,
                  controller: _passwordController,
                  icon: Icon(
                    Icons.lock_outline_rounded,
                    color: Colors.black12,
                  ),
                ),
                SizedBox(height: 85),
                Center(
                    child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    // navigate to otp screen
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Container(
                    // padding: EdgeInsets.all(15),
                    padding: EdgeInsets.only(
                        top: 20.0, bottom: 20, right: 100, left: 100),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50.0)),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Not a member? ",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 55),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      )),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text("Signin With"),
                      SizedBox(width: 5.0),
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey,
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'images/google.png'),
                    SquareTile(imagePath: 'images/twitter.jpeg'),
                    SquareTile(
                      imagePath: 'images/facebook.jpeg',
                    )
                  ],
                )
              ],
            ),
          ),
        ])),
      ),
    );
  }
}
