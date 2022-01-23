import 'package:flutter/material.dart';
import 'package:ius_graduationproject/constants.dart';
import 'package:ius_graduationproject/screens/login_screen.dart';

import 'components/already_have_an_account_acheck.dart';
import 'components/rounded_button.dart';
import 'components/rounded_input_field.dart';
import 'components/rounded_password_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GradApp',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: LoginScreen(),
    );
  }
}

//
// const MyHomePage(title: 'Flutter Demo Home Page'),
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
  // State<MyHomePage> createState() => LoginScreen();
// }

