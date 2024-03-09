import 'package:attendance_app/presentation/widgets/auth_backgound.dart';
import 'package:attendance_app/presentation/widgets/auth_textfields.dart';
import 'package:attendance_app/presentation/widgets/auth_texts.dart';
import 'package:attendance_app/presentation/widgets/buttons.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthTexts authTexts = AuthTexts();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    var _formKey = GlobalKey<FormState>();

    return AuthBackgroundScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 70),
          authTexts.title("Welcome,"),
          authTexts.subtitle("Glad to see you!"),
          SizedBox(height: 45),
          Form(
            child: Column(
              children: [
                AuthTextField(
                  isPassword: false,
                  hint: "Email",
                  controller: emailController,
                ),
                SizedBox(height: 10),
                AuthTextField(
                  isPassword: true,
                  hint: "Password",
                  controller: passwordController,
                ),
                forgotPasswordButton(),
              ],
            ),
          ),
          SizedBox(height: 10),
          LoginButton("Login", onPressed: () {}),
          SizedBox(height: 50),
          Text(
            "Or Login with",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 20),
          SocialLoginButtons(),
          SizedBox(height: 150),
          ChangeAuthTextButton(isLogin: true),
        ],
      ),
    );
  }

  Row forgotPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
            style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero)),
            onPressed: () {},
            child: Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
