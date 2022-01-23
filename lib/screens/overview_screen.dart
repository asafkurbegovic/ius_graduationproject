import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ius_graduationproject/components/rounded_button.dart';
import 'package:ius_graduationproject/models/person_model.dart';
import 'package:ius_graduationproject/screens/qr_view_screen.dart';

class OverviewScreen extends StatelessWidget {
  final items = ['Shampoon:  5 points'];

  // overviewscreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return Card( //                           <-- Card
                        child: ListTile(
                          title: Text(items[index]),
                        ),
                      );
                    },
                  )
                ])));
  }
}
