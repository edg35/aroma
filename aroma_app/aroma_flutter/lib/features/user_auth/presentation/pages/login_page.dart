// ignore_for_file: use_build_context_synchronously

import 'package:aroma_flutter/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:aroma_flutter/features/user_auth/presentation/pages/signup_page.dart';
import 'package:aroma_flutter/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Avoid Memory Leak
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                hintText: 'Email',
                isPasswordField: false,
                controller: _emailController,
              ),
              const SizedBox(
                height: 10,
              ),
              FormContainerWidget(
                hintText: 'Password',
                isPasswordField: true,
                controller: _passwordController,
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: _signIn,
                child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                        (route) => false,
                      );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      // Navigate to Home Page
      Navigator.pushNamed(context, "/home");
    } else {
      // Show Error Message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sign In Failed"),
        ),
      );
    }
  }
}
