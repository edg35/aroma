import 'package:aroma_flutter/features/user_auth/presentation/widgets/form_container_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                        "Login",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
