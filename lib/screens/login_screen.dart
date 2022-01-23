import 'package:flutter/material.dart';
import 'package:ius_graduationproject/components/already_have_an_account_acheck.dart';
import 'package:ius_graduationproject/components/rounded_button.dart';
import 'package:ius_graduationproject/components/rounded_input_field.dart';
import 'package:ius_graduationproject/components/rounded_password_field.dart';
import 'package:ius_graduationproject/models/person_model.dart';
import 'package:ius_graduationproject/screens/home_screen.dart';
import 'package:ius_graduationproject/screens/sign_up_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';


class LoginScreen extends StatelessWidget {
  Person? person = new Person();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                person!.Email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                person!.Password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async{
                String json = jsonEncode(person);
                log("json: $json");
                var response = await http.post(Uri.parse('http://10.0.2.2:5000/api/login'),headers: {
                  "Accept": "application/json",
                  "Content-Type": "application/json"
                }, body: json);
                log("response:${response.body}");
                log("response:${response.statusCode}");
                if(response.statusCode == 200){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen(
                          user: Person.fromJson(jsonDecode(response.body))
                        );
                      },
                    ),
                  );
                }
                else{
                  Fluttertoast.showToast(
                      msg: "Incorrect email or password!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SignUpScreen();
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
