import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final bool isPassword;
  final String hint;
  final TextEditingController controller;
  bool isObscure;
  AuthTextField(
      {super.key,
      required this.isPassword,
      required this.hint,
      required this.controller,
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.27),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white, width: 2)),
      height: 50,
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white, fontSize: 14),
            suffixIcon: isPassword
                ? IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {},
                  )
                : null),
        obscureText: isPassword || isObscure,
        // keyboardType: keytype,
      ),
    );
  }
}
