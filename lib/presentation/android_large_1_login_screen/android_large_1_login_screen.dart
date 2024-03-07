import 'package:attendance_app/widgets/custom_elevated_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:attendance_app/core/app_export.dart';

class AndroidLarge1LoginScreen extends StatelessWidget {
  const AndroidLarge1LoginScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 204.v,
                  width: 223.h,
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
                          "Login",
                          style: theme.textTheme.displaySmall,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 57.v),
                _buildTen(context),
                SizedBox(height: 25.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 9.h),
                    child: Text(
                      "Forgotten Password ?",
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ),
                SizedBox(height: 74.v),
                _buildEleven(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTen(BuildContext context) {
    return SizedBox(
      height: 128.v,
      width: 310.h,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: EdgeInsets.only(right: 57.h),
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 13.v,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: fs.Svg(
                    ImageConstant.imgGroup1,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    decoration: InputDecoration(
                        hintText: "username",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(height: 8.v),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "password",
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        )),
                  ),
                  SizedBox(height: 10.v),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 96.v,
              width: 94.h,
              padding: EdgeInsets.symmetric(
                horizontal: 20.h,
                vertical: 29.v,
              ),
              decoration: AppDecoration.outlineOnPrimary.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder48,
              ),
              child: CustomImageView(
                imagePath: ImageConstant.imgAttach,
                height: 33.v,
                width: 48.h,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEleven(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomElevatedButton(
            width: 159.h,
            text: "Register",
            margin: EdgeInsets.only(bottom: 209.v),
            buttonStyle: CustomButtonStyles.outlinePrimaryLR30,
          ),
          CustomImageView(
            imagePath: ImageConstant.imgDesignUpperBlue200,
            height: 216.v,
            width: 201.h,
            margin: EdgeInsets.only(top: 50.v),
          ),
        ],
      ),
    );
  }
}
