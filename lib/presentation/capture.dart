import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: capturescreen(),
    );
  }
}

class capturescreen extends StatefulWidget {
  @override
  _capturescreenState createState() => _capturescreenState();
}

class _capturescreenState extends State<capturescreen> {
  File? _image;
  bool isSending = false;
  String studentId = "";
  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
    setState(() {});
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      print("Image is null");
      return;
    }
    setState(() {
      isSending = true;
    });

    // API endpoint
    var url =
        'http://ec2-13-60-19-202.eu-north-1.compute.amazonaws.com/predict';

    // Read image as bytes
    List<int> imageBytes = await _image!.readAsBytes();

    // Encode image bytes to base64 string
    String base64Image = base64Encode(imageBytes);

    // Prepare POST request body
    var requestBody = jsonEncode({"image": base64Image});

    // Set headers
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    try {
      print("sending request");
      // Make POST request
      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: requestBody,
      );
      print("response");
      // Handle response
      if (response.statusCode == 200) {
        // Successful response
        print('API Response: ${response.body}');
        studentId =
            "Student id is ${jsonDecode(response.body)["predicted_class"]}";
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("api response ${response.body}")));
        setState(() {
          isSending = false;
        });
        // You can handle the response here
      } else {
        // Error occurred
        print('Error: ${response.statusCode}');
        setState(() {
          isSending = false;
        });
      }
    } catch (e) {
      setState(() {
        isSending = false;
      });
      print(e);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error while sending request")));
    }
  }

  @override
  void initState() {
    super.initState();
    print("widget called");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Image Picker & API Call Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _image == null
                ? Text('No image selected.')
                : Image.file(_image!),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              studentId,
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          isSending
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(),
                      ElevatedButton(
                        onPressed: () => _getImage(ImageSource.camera),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.camera_alt),
                              Text("Camera"),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        onPressed: () => _getImage(ImageSource.gallery),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.browse_gallery),
                              Text("Gallery"),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.black)),
                        onPressed: _uploadImage,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(Icons.cloud_upload),
                              Text("Send Request"),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
