import 'package:newapexproject/constant.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({Key? key, this.function, this.label}) : super(key: key);
  final String? label;
  final Function()? function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(
        label!,
        style: const TextStyle(fontSize: 16),
      ),
      style: ElevatedButton.styleFrom(
          fixedSize: const Size(220, 60),
          primary: K.mainColor,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    );
  }
}
