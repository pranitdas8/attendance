import 'package:attendance_app/widgets/custom_elevated_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:attendance_app/core/app_export.dart';

class AndroidLarge1RegisterScreen extends StatelessWidget {
  const AndroidLarge1RegisterScreen({Key? key})
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
              _buildSix(context),
              SizedBox(height: 45.v),
              SizedBox(
                height: 512.v,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    CustomImageView(
                      imagePath: ImageConstant.imgDesignUpperBlue200,
                      height: 216.v,
                      width: 201.h,
                      alignment: Alignment.bottomRight,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        margin: EdgeInsets.only(right: 107.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.h,
                          vertical: 16.v,
                        ),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: fs.Svg(
                              ImageConstant.imgGroup3,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgGroup1BlueGray100,
                                  height: 29.v,
                                  width: 28.h,
                                  margin: EdgeInsets.only(bottom: 3.v),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.h),
                                  child: Text(
                                    "Name",
                                    style: CustomTextStyles
                                        .headlineMediumBluegray100,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24.v),
                            Row(
                              children: [
                                CustomImageView(
                                  imagePath: ImageConstant.imgMageEmail,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  margin: EdgeInsets.only(
                                    top: 6.v,
                                    bottom: 2.v,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.h),
                                  child: Text(
                                    "Email",
                                    style: CustomTextStyles
                                        .headlineMediumBluegray100,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.v),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 3.h,
                                right: 47.h,
                              ),
                              child: Row(
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgGroup11,
                                    height: 25.v,
                                    width: 23.h,
                                    margin: EdgeInsets.only(
                                      top: 6.v,
                                      bottom: 1.v,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 13.h),
                                    child: Text(
                                      "Employee Id",
                                      style: CustomTextStyles
                                          .headlineMediumBluegray100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 34.v),
                            Padding(
                              padding: EdgeInsets.only(right: 50.h),
                              child: Row(
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgGroup12,
                                    height: 24.adaptSize,
                                    width: 24.adaptSize,
                                    margin: EdgeInsets.only(
                                      top: 5.v,
                                      bottom: 4.v,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 16.h),
                                    child: Text(
                                      "Department",
                                      style: CustomTextStyles
                                          .headlineMediumBluegray100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 28.v),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 4.h,
                                right: 18.h,
                              ),
                              child: Row(
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgGroup13,
                                    height: 24.adaptSize,
                                    width: 24.adaptSize,
                                    margin: EdgeInsets.symmetric(vertical: 4.v),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.h),
                                    child: Text(
                                      " Image",
                                      style: CustomTextStyles
                                          .headlineMediumBluegray100,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 122.adaptSize,
                        width: 122.adaptSize,
                        margin: EdgeInsets.only(
                          top: 97.v,
                          right: 24.h,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 33.h,
                          vertical: 39.v,
                        ),
                        decoration: AppDecoration.outlineOnPrimary.copyWith(
                          borderRadius: BorderRadiusStyle.circleBorder61,
                        ),
                        child: CustomImageView(
                          imagePath: ImageConstant.imgCheckmark,
                          height: 37.v,
                          width: 53.h,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildSix(BuildContext context) {
    return SizedBox(
      height: 216.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgDesignUpper,
            height: 178.v,
            width: 207.h,
            alignment: Alignment.topLeft,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              "Register",
              style: theme.textTheme.displaySmall,
            ),
          ),
          CustomElevatedButton(
            width: 150.h,
            text: "Login",
            margin: EdgeInsets.only(top: 63.v),
            buttonStyle: CustomButtonStyles.outlinePrimaryLR30,
            alignment: Alignment.topRight,
          ),
        ],
      ),
    );
  }
}
