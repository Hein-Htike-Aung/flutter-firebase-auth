import 'package:auth_firebase/login_page.dart';
import 'package:auth_firebase/splish_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

void main() async {
  // DI (AuthController will be available throughout the whole app)
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then(((value) => Get.put(AuthController)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}
