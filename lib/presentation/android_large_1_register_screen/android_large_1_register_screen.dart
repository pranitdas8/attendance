import 'package:attendance_app/widgets/custom_elevated_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:attendance_app/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AndroidLarge1RegisterScreen extends StatelessWidget {
  AndroidLarge1RegisterScreen({Key? key}) : super(key: key);

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 29.v,
                                  width: 28.h,
                                  child: CustomImageView(
                                    imagePath:
                                        ImageConstant.imgGroup1BlueGray100,
                                    margin: EdgeInsets.only(bottom: 3.v),
                                  ),
                                ),
                                SizedBox(
                                    width: 10
                                        .h), // Add spacing between image and text
                                SizedBox(
                                  height: 40.v,
                                  width: 150.h,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Name",
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (value) {
                                      print(
                                          "Name: $value"); // Debug: Print the entered name
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 24.v),
                            Row(
                              children: [
                                SizedBox(
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  child: CustomImageView(
                                    imagePath: ImageConstant.imgMageEmail,
                                    margin:
                                        EdgeInsets.only(top: 6.v, bottom: 2.v),
                                  ),
                                ),
                                SizedBox(
                                    width: 10
                                        .h), // Add spacing between icon and text field
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Email",
                                      border: OutlineInputBorder(),
                                    ),
                                    onChanged: (value) {
                                      print(
                                          "Email: $value"); // Debug: Print the entered email
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.v),
                            Padding(
                              padding: EdgeInsets.only(left: 3.h, right: 47.h),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 25.v,
                                    width: 23.h,
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgGroup11,
                                      margin: EdgeInsets.only(
                                          top: 6.v, bottom: 1.v),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 13
                                          .h), // Add spacing between icon and text field
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Employee ID",
                                        border: OutlineInputBorder(),
                                      ),
                                      onChanged: (value) {
                                        print(
                                            "Employee ID: $value"); // Debug: Print the entered employee ID
                                      },
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
                                  SizedBox(
                                    height: 24.adaptSize,
                                    width: 24.adaptSize,
                                    child: CustomImageView(
                                      imagePath: ImageConstant.imgGroup12,
                                      margin: EdgeInsets.only(
                                          top: 5.v, bottom: 4.v),
                                    ),
                                  ),
                                  SizedBox(
                                      width: 16
                                          .h), // Add spacing between icon and text field
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: "Department",
                                        border: OutlineInputBorder(),
                                      ),
                                      onChanged: (value) {
                                        print(
                                            "Department: $value"); // Debug: Print the entered department
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 28.v),
                            Padding(
                              padding: EdgeInsets.only(left: 4.h, right: 18.h),
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
                                    child: TextButton(
                                      onPressed: () {
                                        // Add functionality to capture image
                                        print(
                                            "Capture button pressed"); // Debug: Print when the capture button is pressed
                                      },
                                      child: Text(
                                        "Capture",
                                        style: TextStyle(
                                          color: Colors
                                              .blue, // Change the text color to match the button style
                                        ),
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 122.adaptSize,
                        width: 122.adaptSize,
                        margin: EdgeInsets.only(top: 97.v, right: 24.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 33.h, vertical: 39.v),
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
            onPressed: () {
              // Add functionality to store data in Firestore when the login button is pressed
              print(
                  "Login button pressed"); // Debug: Print when the login button is pressed
              _storeDataInFirestore();
            },
          ),
        ],
      ),
    );
  }

  void _storeDataInFirestore() {
    // Here, you can write the code to store the data in Firestore
    // Access the data from the text fields and use the Firestore instance to add a document to the "Registration" collection
    // For example:
    firestore.collection("Registration").add({
      "name":
          "John Doe", // Replace with the actual name entered in the text field
      "email":
          "john.doe@example.com", // Replace with the actual email entered in the text field
      "employee_id":
          "12345", // Replace with the actual employee ID entered in the text field
      "department":
          "IT", // Replace with the actual department entered in the text field
    }).then((value) {
      print(
          "Data stored successfully"); // Debug: Print when the data is stored successfully
    }).catchError((error) {
      print(
          "Error storing data: $error"); // Debug: Print if there's an error while storing the data
    });
  }
}
