import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ius_graduationproject/components/rounded_button.dart';
import 'package:ius_graduationproject/models/person_model.dart';
import 'package:ius_graduationproject/screens/qr_view_screen.dart';

import 'overview_screen.dart';

class HomeScreen extends StatelessWidget {
  final Person user;

  HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          Text(
            "First name: ${user.FirstName}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "Last name: ${user.LastName}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            "Email: ${user.Email}",
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.3),
          RoundedButton(
              text: "Scan your code",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const QRViewScreen(),
                ));
              }),
          SizedBox(height: size.height * 0.07),
          RoundedButton(
              text: "Check your points",
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => OverviewScreen(),
                ));
              })
        ])));
  }
}
