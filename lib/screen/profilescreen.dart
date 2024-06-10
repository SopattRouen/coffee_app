import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_test_1/controller/authcontroller.dart';
import 'package:coffee_test_1/dialogscreen/change_pass.dart';
import 'package:coffee_test_1/dialogscreen/edit_dialog.dart';
import 'package:coffee_test_1/dialogscreen/info.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../dialogscreen/logout.dart';
import '../dialogscreen/upgrade.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final controll = AuthController();

class _ProfileScreenState extends State<ProfileScreen> {
  String email = '';
  String username = '';
  @override
  void initState() {
    super.initState();
    // Call the function to get user data when the widget is initialized
    getUserData();
  }

  Future getUserData() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // Retrieve email

      setState(() {
        email = user.email!;
      });

      // Retrieve username - Firebase Authentication doesn't directly provide a username field.
      // You'll typically store this information in Firestore or Realtime Database during user registration.
      // If you've stored the username in Firestore, you can retrieve it like this:
      // Assuming you have a 'users' collection where each document's ID is the user's UID.
      // String? username;
      try {
        DocumentSnapshot<Object?> userData = await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .get();
        setState(() {
          username = userData['name'];
        });
      } catch (e) {
        print("Error getting user data: $e");
      }

      // Now you have both the email and username
      print("Email: $email");
      if (username != 0) {
        print("Username: $username");
      } else {
        print("Username not found");
      }
    }
  }

  final ImagePicker _picker = ImagePicker();

  XFile? _image;
  Future<void> saveImage() async {
    if (_image != null) {
      // Get the temporary directory using path_provider
      Directory tempDir = await getTemporaryDirectory();

      // Create a unique filename for the saved image
      String fileName = DateTime.now().toIso8601String();
      String filePath = '${tempDir.path}/$fileName.png';

      // Copy the image to the new file
      await _image!.saveTo(filePath);

      // Now you can use the 'filePath' to access the saved image path
      print('Image saved at: $filePath');
    } else {
      print('No image selected.');
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);

      setState(() {
        _image = pickedFile;
      });
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 16, 9),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(300),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.circular(300),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 25,
                    ),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 40,
                        ),
                        _image == null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 25,
                                ),
                                child: Text(
                                  "Photo",
                                  style: TextStyle(
                                    fontSize: 15,
                                  ),
                                ),
                              )
                            : Image.file(
                                File(_image!.path),
                              ),
                        Positioned(
                          bottom: 0,
                          left: 50,
                          child: GestureDetector(
                            onTap: () {
                              _pickImage(ImageSource.gallery);
                            },
                            child: Icon(
                              Icons.camera_alt_outlined,
                              size: 26,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 35),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "$username",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            if (_image != null)
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    saveImage();
                                  });
                                },
                                child: Icon(
                                  Icons.save,
                                ),
                              ),
                          ],
                        ),
                        Text(
                          "$email",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    EditProfile(),
                    SizedBox(
                      height: 10,
                    ),
                    ChangPassword(),
                    SizedBox(
                      height: 10,
                    ),
                    Info(),
                    SizedBox(
                      height: 10,
                    ),
                    Upgrade(),
                    SizedBox(
                      height: 10,
                    ),
                    Logout(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
