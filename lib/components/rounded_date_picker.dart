import 'package:flutter/material.dart';
import 'package:ius_graduationproject/constants.dart';


class RoundedDatePickButton extends StatelessWidget {
  final String? text;
  final VoidCallback? press;
  final Color color, textColor;
  final IconData icon;
  const RoundedDatePickButton({
    Key? key,
    this.text,
    this.press,
    this.icon = Icons.date_range_rounded,
    this.color = kPrimaryLightColor,
    this.textColor = kPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: newElevatedButton(),
      ),
    );
  }

  //Used:ElevatedButton as FlatButton is deprecated.
  //Here we have to apply customizations to Button by inheriting the styleFrom

  Widget newElevatedButton() {
    return ElevatedButton(
      child: TextField(
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          enabled: false,
          labelText: text,
          border: InputBorder.none,
        ),

      ),
      onPressed: press,

      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 20),
          textStyle: TextStyle(
              color: textColor, fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }
}








// ignore: must_be_immutable

// class RoundedDatePicker extends StatefulWidget {
//   const RoundedDatePicker({Key? key}) : super(key: key);
//
//   @override
//   State<StatefulWidget> createState() => DatePickInput();
//
// }
//
// class DatePickInput extends State<RoundedDatePicker> {
//   // final VoidCallback? press;
//   // final Color color, textColor;
//   // DatePickInput({
//   //   Key? key,
//   //   // this.text,
//   //   this.press,
//   //   this.color = kPrimaryColor,
//   //   this.textColor = Colors.white,
//   // }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10),
//       width: size.width * 0.8,
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(29),
//         child: newElevatedButton(context),
//       ),
//     );
//   }
//
//   //Used:ElevatedButton as FlatButton is deprecated.
//   //Here we have to apply customizations to Button by inheriting the styleFrom
//
//   Widget newElevatedButton(BuildContext context) {
//     return ElevatedButton(
//       child: Text(
//         "Date of birth: " + "${selectedDate.toLocal()}".split(' ')[0],
//         style: TextStyle(color: kPrimaryColor),
//       ),
//       onPressed: () => _selectDate(context),
//       style: ElevatedButton.styleFrom(
//           primary: kPrimaryLightColor,
//           padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//           textStyle: TextStyle(
//               color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
//     );
//   }
//
//   DateTime selectedDate = DateTime.now();
//
//   Future<Null> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         initialDate: selectedDate,
//         firstDate: DateTime(2015, 8),
//         lastDate: DateTime(2101));
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//       // });
//   }
// }
