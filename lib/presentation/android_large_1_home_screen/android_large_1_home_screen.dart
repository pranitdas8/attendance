import 'package:attendance_app/presentation/android_large_1_login_screen/android_large_1_login_screen.dart';
import 'package:attendance_app/presentation/android_large_1_register_screen/android_large_1_register_screen.dart';
import 'package:attendance_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/core/app_export.dart';

class AndroidLarge1HomeScreen extends StatelessWidget {
  const AndroidLarge1HomeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 201.v,
                  width: 225.h,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgDesignUpper,
                        height: 178.v,
                        width: 207.h,
                        alignment: Alignment.topLeft,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "Home",
                          style: theme.textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 38.v),
              CustomElevatedButton(
                width: 167.h,
                text: "Login",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AndroidLarge1LoginScreen()));
                },
              ),
              SizedBox(height: 20.v),
              CustomElevatedButton(
                width: 167.h,
                text: "Register",
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AndroidLarge1RegisterScreen()));
                },
              ),
              SizedBox(height: 20.v),
              CustomElevatedButton(
                width: 205.h,
                text: "Capture Image",
              ),
              Spacer(),
              CustomImageView(
                imagePath: ImageConstant.imgDesignUpperBlue200,
                height: 216.v,
                width: 201.h,
                alignment: Alignment.centerRight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
