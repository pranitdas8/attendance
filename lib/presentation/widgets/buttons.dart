// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  String text = "Login";
  void Function() onPressed;
  LoginButton(
    this.text, {
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class SignupButton extends StatelessWidget {
  void Function() onPressed;
  SignupButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.transparent,
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          border: Border.all(color: Colors.white, width: 3)),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // foregroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class SocialLoginButtons extends StatelessWidget {
  SocialLoginButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SocialLoginButton(),
        SizedBox(width: 10),
        SocialLoginButton(),
      ],
    );
  }

  ElevatedButton SocialLoginButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle login button press
      },
      child: Container(
        height: 50,
        width: 118,
        decoration: BoxDecoration(),
        child: Icon(Icons.facebook),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class ChangeAuthTextButton extends StatelessWidget {
  final bool isLogin;
  const ChangeAuthTextButton({
    super.key,
    required this.isLogin,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: RichText(
        text: new TextSpan(
          style: new TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
          children: <TextSpan>[
            new TextSpan(
                text: isLogin
                    ? "Don't have an account? "
                    : "Already have an account? "),
            new TextSpan(
              text: isLogin ? 'Sign Up Now' : "Login Now",
              style: new TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
