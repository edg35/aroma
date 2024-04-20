// ignore_for_file: use_build_context_synchronously

import 'package:aroma_flutter/features/user_auth/firebase_auth_implementation/firebase_auth_services.dart';
import 'package:aroma_flutter/features/user_auth/presentation/pages/login_page.dart';
import 'package:aroma_flutter/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isSigningUp = false;

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
          title: const Text('Sign Up Page'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                FormContainerWidget(
                  hintText: 'Email',
                  isPasswordField: false,
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 20,
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
                  onTap: _signUp,
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: _isSigningUp
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : const Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account?"),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text(
                        "Login",
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
        ));
  }

  void _signUp() async {
    setState(() {
      _isSigningUp = true;
    });

    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    setState(() {
      _isSigningUp = false;
    });

    if (user != null) {
      // Navigate to Home Page
      Navigator.pushNamed(context, "/home");
    } else {
      // Show Error Message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sign Up Failed"),
        ),
      );
    }
  }
}
