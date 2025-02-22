import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/utils/helpers/shared_pref_helper.dart';
import 'package:flutter_application_1/views/home_view.dart';
import 'package:flutter_application_1/views/welcome_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool isLoggedIn;

  @override
  void initState() {
    super.initState();
    getLoggedInState();
  }

  void getLoggedInState() async {
    isLoggedIn = await SharedPrefHelper.getLoggedInState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Secure Chat App',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(143, 148, 251, 1),
      ),
      home: isLoggedIn ? HomeScreen() : WelcomeScreen(),
    );
  }
}