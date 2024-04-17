import 'package:aroma_flutter/features/user_auth/presentation/pages/login_page.dart';
import 'package:aroma_flutter/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
                const FormContainerWidget(
                  hintText: 'Email',
                  isPasswordField: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                const FormContainerWidget(
                  hintText: 'Password',
                  isPasswordField: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
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
}
