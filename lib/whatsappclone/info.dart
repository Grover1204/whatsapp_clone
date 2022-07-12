import 'dart:typed_data';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoapp/dbHelper/model.dart';
import 'package:demoapp/dbHelper/mongodb.dart';
import 'package:demoapp/screens/homepage.dart';
import 'package:demoapp/widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

import '../widgets/color.dart';
import '../widgets/reusetextfield.dart';
import '../widgets/reusetextfield.dart';

class InfoScreen extends StatefulWidget {
  InfoScreen({Key? key}) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  Uint8List? _image;
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _passnamecontroller = TextEditingController();
  TextEditingController _agecontroller = TextEditingController();
  TextEditingController _latitudecontroller = TextEditingController();
  TextEditingController _longitudecontroller = TextEditingController();

  CollectionReference users =
      FirebaseFirestore.instance.collection('user data');

  String? photoUrl;
  bool _isloading = false;
  void selectImageFromGallery() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void selectImageFromCamera() async {
    Uint8List im = await pickImage(ImageSource.camera);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
        borderSide: Divider.createBorderSide(context),
        borderRadius: BorderRadius.all(Radius.circular(10)));
    return Scaffold(
      appBar: AppBar(
        title: Text('Info'),
      ),
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 48),
              Stack(
                alignment: Alignment.center,
                children: [
                  _image != null
                      ? CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 64,
                          backgroundImage: MemoryImage(_image!))
                      : CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1433086966358-54859d0ed716?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                          ),
                        ),
                  Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {
                          showAlertDialog(context, selectImageFromCamera,
                              selectImageFromGallery);
                        },
                        icon:
                            const Icon(Icons.add_a_photo, color: Colors.green),
                      ))
                ],
              ),
              SizedBox(height: 24),
              TextfieldInput(
                hintText: 'Enter your username',
                textInputType: TextInputType.text,
                textEditingController: _usernamecontroller,
              ),
              SizedBox(height: 24),
              TextfieldInput(
                hintText: ' Password',
                textInputType: TextInputType.text,
                textEditingController: _passnamecontroller,
              ),
              SizedBox(height: 24),
              TextfieldInput(
                hintText: 'age',
                textInputType: TextInputType.text,
                textEditingController: _agecontroller,
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 5),
                      child: TextField(
                        controller: _latitudecontroller,
                        decoration: InputDecoration(
                          hintText: 'Latitude',
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          filled: true,
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Container(
                      margin: EdgeInsets.only(left: 5, right: 10),
                      child: TextField(
                        controller: _longitudecontroller,
                        decoration: InputDecoration(
                          hintText: 'Longitude',
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          filled: true,
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 48),
              InkWell(
                onTap: () async {
                  await users.add(
                    {
                      'email': _usernamecontroller.text,
                      'password': _passnamecontroller.text,
                      'age': _agecontroller.text,
                      'latitude': _latitudecontroller.text,
                      'Longitude': _longitudecontroller.text,
                    },
                  ).then(
                    (value) => print('User added data'),
                  );
                  _insertData(
                    _usernamecontroller.text,
                    _passnamecontroller.text,
                    _agecontroller.text,
                    _latitudecontroller.text,
                    _longitudecontroller.text,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Container(
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 17),
                  ),
                  width: 130,
                  height: 50,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    color: blueColor,
                  ),
                ),
              ),
              SizedBox(height: 48),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  child: Text(
                    'Go back to Homepage',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 24),
              Divider(
                thickness: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _insertData(
    String fname,
    String fpass,
    String fage,
    String flatitude,
    String flongitude,
  ) async {
    var _id = M.ObjectId();
    final data = MongoDbModel(
      id: _id,
      username: fname,
      password: fpass,
      age: fage,
      latitude: flatitude,
      longitude: flongitude,
    );
    var result = await MongoDatabase.insert(data);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('data is inserted ' + _id.$oid)));
  }
}
