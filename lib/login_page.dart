import 'package:auth_firebase/auth_controller.dart';
import 'package:auth_firebase/signup_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          /* Image */
          Container(
            width: width,
            height: height * 0.3,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/loginimg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          /* Form */
          Container(
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Hello",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign into your account",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ],
                  ),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Colors.deepOrangeAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: 7,
                          offset: const Offset(1, 1),
                          color: Colors.grey.withOpacity(0.2))
                    ],
                  ),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Colors.deepOrangeAccent,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      "Forgot your password?",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade500,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              AuthController.instance.login(
                  emailController.text.trim(), passwordController.text.trim());
            },
            child: Container(
              width: width * 0.5,
              height: height * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: const DecorationImage(
                  image: AssetImage("images/loginbtn.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Center(
                child: Text(
                  "Sign in",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.08),
          RichText(
            text: TextSpan(
              text: "Don't have an account?",
              style: TextStyle(color: Colors.grey[500], fontSize: 15),
              children: [
                TextSpan(
                  // .. means rewrite the object and get the properties
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.to((() => const SignUpPage())),
                  text: " Create",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
