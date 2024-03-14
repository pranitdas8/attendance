import 'dart:io';

import 'package:attendance_app/widgets/custom_elevated_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:flutter/material.dart';
import 'package:attendance_app/core/app_export.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:attendance_app/presentation/widgets/auth_backgound.dart';
import 'package:attendance_app/presentation/widgets/auth_textfields.dart';
import 'package:attendance_app/presentation/widgets/auth_texts.dart';
import 'package:attendance_app/presentation/widgets/buttons.dart';

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
    final AuthTexts authTexts = AuthTexts();
    var _formKey = GlobalKey<FormState>();

    return AuthBackgroundScaffold(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 70),
          authTexts.title("Register"), // Changed title to "Register"
          authTexts
              .subtitle("Please fill in the details below"), // Changed subtitle
          SizedBox(height: 45),
          Form(
            child: Column(
              children: [
                AuthTextField(
                  isPassword: false,
                  hint: "Name",
                  controller: nameController,
                ),
                SizedBox(height: 10),
                AuthTextField(
                  isPassword: false,
                  hint: "Email",
                  controller: emailController,
                ),
                SizedBox(height: 10),
                AuthTextField(
                  isPassword: false,
                  hint: "Employee ID",
                  controller: employeeIdController,
                ),
                SizedBox(height: 10),
                AuthTextField(
                  isPassword: false,
                  hint: "Department",
                  controller: departmentController,
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(
                width: 150,
                text: "Capture",
                onPressed: _getImage,
              ),
              SizedBox(width: 20),
              CustomElevatedButton(
                width: 150,
                text: "Submit",
                onPressed: _storeDataInFirestore,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(
        source: ImageSource
            .camera); // Changed source to ImageSource.camera for capturing from camera
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
