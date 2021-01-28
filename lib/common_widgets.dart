import 'package:flutter/material.dart';

class TextField extends StatelessWidget {

  final String labelName;
  final String hintText;
  const TextField(this.labelName, this.hintText);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: labelName,
          hintText: "Enter Email id"
      ),
      validator: (value) {
        //   if (value.isEmpty && !emailReg.hasMatch(value)) {
        //     return 'Please Enter valid Email id';
        //   }
        //   return null;
        print(value);
      },
    );
  }
}
