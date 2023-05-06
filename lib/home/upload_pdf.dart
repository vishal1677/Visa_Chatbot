import 'dart:convert';
import 'dart:io';
import 'dart:io' show File;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';



class UploadPdf extends StatefulWidget {
  const UploadPdf({Key? key}) : super(key: key);

  @override
  _UploadPdfState createState() => _UploadPdfState();
}



class _UploadPdfState extends State<UploadPdf> {

  File? _image;
  String? message;
  var data;

  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    _image = File(image!.path);
    setState(() {});
  }
// uploading image from here
  uploadImage() async {
    final request = http.MultipartRequest(
        "POST", Uri.parse("https://b33b-117-205-11-137.in.ngrok.io/upload"));
    final headers = {"Content-type": "multipart/form-data"};
    request.files.add(http.MultipartFile('image',
        _image!. readAsBytes().asStream(), _image!.lengthSync(),
    filename: _image!. path.split("/").last));
    request.headers.addAll(headers);
    final response = await request.send();
    http.Response res = await http.Response.fromStream (response);
    
    Map<String,dynamic> dict = jsonDecode(res.body);

     // for( MapEntry<String, dynamic> e in dict.entries){
     //  dict[e.key]=double.parse(e.value).toString();
     // }
    print(dict);
    data = json.decode(res.body);
    User user = FirebaseAuth.instance.currentUser!;
    FirebaseFirestore db = FirebaseFirestore.instance;
    db.collection("reports")
        .doc(user.uid)
        .collection('Reports')
         .add(dict)
        ;

    setState(() {});


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(" Report"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _image == null
              ? Text('No image selected.')
              : Image.file(_image!),

          Container(
            width: MediaQuery.of(context).size.width,
          ),

          ElevatedButton(
              child: Text("Upload Image & Predict", style: TextStyle(color: Colors.white,fontSize:20)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
              ),
              onPressed: uploadImage,
          ),
          SizedBox(height: 20,),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
          child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

class UPLOADPDF extends StatelessWidget {
  const UPLOADPDF({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
