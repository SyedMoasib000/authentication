import 'package:authentication/UI/screens/Login/sign_in.dart';
import 'package:authentication/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    theme: ThemeData(brightness: Brightness.light),
    debugShowCheckedModeBanner: false,
    home: const SignIn(),
  ));
}
