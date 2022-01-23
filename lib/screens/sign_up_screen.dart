// ignore: file_names
import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:ius_graduationproject/components/already_have_an_account_acheck.dart';
import 'package:ius_graduationproject/components/rounded_button.dart';
import 'package:ius_graduationproject/components/rounded_date_picker.dart';
import 'package:ius_graduationproject/components/rounded_input_field.dart';
import 'package:ius_graduationproject/components/rounded_password_field.dart';
import 'package:ius_graduationproject/models/person_model.dart';

import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  DateTime? selectedDate;
  final dateForamter = new DateFormat('dd.MM.yyyy');
  Person? person = new Person();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        this.person!.BirthDate = selectedDate.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "First name",
              onChanged: (value) {
                person!.FirstName = value;
              },
            ),
            RoundedInputField(
              hintText: "Last name",
              onChanged: (value) {
                person!.LastName = value;
              },
            ),
            RoundedDatePickButton(
                text: selectedDate != null
                    ? dateForamter.format(
                        new DateTime.fromMicrosecondsSinceEpoch(
                            selectedDate!.microsecondsSinceEpoch))
                    : "Date of birth",
                press: () {
                  _selectDate(context);
                }),
            RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  person!.Email = value;
                  ;
                }),
            RoundedPasswordField(
              onChanged: (value) {
                person!.Password = value;
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                log("message:  ${person!.LastName.toString()}");
                String json = jsonEncode(person);
                log("json: $json");
                var response = await http.post(Uri.parse('http://10.0.2.2:5000/api/register'),headers: {
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
                        return LoginScreen();
                      },
                    ),
                  );
                }
                else{
                  Fluttertoast.showToast(
                      msg: "Sorry something went wrong, try again later",
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
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
