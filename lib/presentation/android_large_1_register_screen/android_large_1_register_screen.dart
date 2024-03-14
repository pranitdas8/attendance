import 'dart:io';

import 'package:attendance_app/widgets/custom_elevated_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:attendance_app/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AndroidLarge1RegisterScreen extends StatefulWidget {
  AndroidLarge1RegisterScreen({Key? key}) : super(key: key);

  @override
  _AndroidLarge1RegisterScreenState createState() =>
      _AndroidLarge1RegisterScreenState();
}

class _AndroidLarge1RegisterScreenState
    extends State<AndroidLarge1RegisterScreen> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController employeeIdController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  File? _imageFile;

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
                                    decoration: const InputDecoration(
                                      hintText: "Name",
                                      border: OutlineInputBorder(),
                                    ),
                                    controller: nameController,
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
                                    decoration: const InputDecoration(
                                      hintText: "Email",
                                      border: OutlineInputBorder(),
                                    ),
                                    controller: emailController,
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
                                      decoration: const InputDecoration(
                                        hintText: "Employee ID",
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: employeeIdController,
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
                                      decoration: const InputDecoration(
                                        hintText: "Department",
                                        border: OutlineInputBorder(),
                                      ),
                                      controller: departmentController,
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
                                      onPressed: _getImage,
                                      child: const Text(
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
                            ElevatedButton(
                              onPressed: _storeDataInFirestore,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Container(
                                height: 50.h,
                                width: double.infinity,
                                decoration: const BoxDecoration(),
                                child: const Center(
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                          ],
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
            onPressed: _storeDataInFirestore,
          ),
        ],
      ),
    );
  }

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
        source: ImageSource
            .camera); // Change source to ImageSource.camera for capturing from camera
    setState(() {
      _imageFile = image != null ? File(image.path) : null;
    });
  }

  void _storeDataInFirestore() async {
    // Check if employee ID already exists
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("Registration")
        .where("employee_id", isEqualTo: employeeIdController.text)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // If employee ID already exists, display error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Employee ID already exists"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      return; // Exit the function if employee ID already exists
    }

    // Upload image to Firebase Storage
    if (_imageFile != null) {
      try {
        // Create a reference to the image file in Firebase Storage
        String fileName = employeeIdController.text + '.jpg';
        firebase_storage.Reference ref =
            firebase_storage.FirebaseStorage.instance.ref().child(fileName);

        // Upload the image file to Firebase Storage
        await ref.putFile(_imageFile!);

        // Get the download URL of the uploaded image
        String imageUrl = await ref.getDownloadURL();

        // Store the image URL and other data in Firestore
        await firestore.collection("Registration").add({
          "name": nameController.text,
          "email": emailController.text,
          "employee_id": employeeIdController.text,
          "department": departmentController.text,
          "image_url": imageUrl,
        });

        // Show registered message
        _showRegisteredMessage();

        print("Data stored successfully with image URL: $imageUrl");
      } catch (error) {
        print("Error uploading image to Firebase Storage: $error");
      }
    } else {
      // If no image is selected, store data without image URL
      await firestore.collection("Registration").add({
        "name": nameController.text,
        "email": emailController.text,
        "employee_id": employeeIdController.text,
        "department": departmentController.text,
      });

      // Show registered message
      _showRegisteredMessage();

      print("Data stored successfully without image URL");
    }
  }

  // Function to show registered message
  void _showRegisteredMessage() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Registered"),
          content: Text("You have been successfully registered"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
