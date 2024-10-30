// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:buybuzz/screens/auth/auth_util/square_tile.dart';
import 'package:buybuzz/screens/auth/auth_util/textfield.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final void Function()? onTap;
  RegisterScreen({
    super.key,
    this.onTap,
  });
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  void login() {}

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(children: [
        Positioned(
            bottom: 20, left: 120, child: bottomWidget(screenSize.width)),
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
                hintText: 'Full name',
                obscureText: true,
                controller: _nameController,
                icon: Icon(Icons.person, color: Colors.black38),
              ),
              SizedBox(height: 10),
              MyTextField(
                hintText: 'Enter your email',
                obscureText: true,
                controller: _emailController,
                icon: Icon(Icons.email_outlined, color: Colors.black38),
              ),
              SizedBox(height: 10),
              MyTextField(
                hintText: 'Enter your password',
                obscureText: true,
                controller: _passwordController,
                icon: Icon(Icons.lock, color: Colors.black38),
              ),
              SizedBox(height: 55),
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
                  Navigator.pushNamed(context, '/otp');
                },
                child: Container(
                  // padding: EdgeInsets.all(15),
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20, right: 100, left: 100),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50.0)),
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Login",
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
              SizedBox(height: 30),
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
    );
  }

  Widget bottomWidget(double screenWidth) {
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment(0.6, -1.1),
            end: Alignment(0.7, 0.8),
            colors: const [
              Colors.indigo,
              Color.fromARGB(0, 207, 213, 213),
            ],
          )),
    );
  }
}
