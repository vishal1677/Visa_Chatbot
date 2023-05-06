import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:visachatbot/home/home_screen.dart';
import 'package:visachatbot/sign_in/sign_in_screen.dart';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'mobileotp.dart';

class MobileLogin extends StatefulWidget {
  static String routeName="/mobileauth";
  const MobileLogin({Key? key}) : super(key: key);
  static String verify="";
  @override
  State<MobileLogin> createState() => _MobileLoginState();
}

class _MobileLoginState extends State<MobileLogin> {

  TextEditingController countrycode = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController FirstName = TextEditingController();
  TextEditingController LastName = TextEditingController();

  @override
  void initState() {
    countrycode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var PhoneNo;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(child: const Text("Phone Verification")),
          elevation: 20,
          backgroundColor: Colors.teal[500],
          // actions: [
          //   IconButton(
          //       onPressed: (){
          //         //Navigator.push(context, MaterialPageRoute(builder: (context)=>SignInScreen()));
          //       },
          //       icon: Icon(
          //         Icons.admin_panel_settings_rounded,
          //         color: Colors.indigo[700],
          //       )
          //   ),
          // ],
        ),
        body:
        Container(
          margin: EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.center,
          child:
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/enter-password.gif", height: 200, width: 200,alignment: Alignment.topCenter,),
                SizedBox(height: 5,),
                Text("Phone Verification", style: TextStyle(
                  fontSize: 22,fontWeight: FontWeight.bold,
                ),
                ),
                SizedBox(height: 5,),
                Text("You need to register before getting started",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20,),
                Container(
                  child: TextField(
                    controller: FirstName,
                    decoration: InputDecoration(
                      hintText: "First Name",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.teal,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black87,
                          width: 2,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  child: TextField(
                    controller: LastName,
                    decoration: InputDecoration(
                      hintText: "Last Name",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.teal,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                          color: Colors.black87,
                          width: 2,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.teal),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      SizedBox(
                        width: 40,
                        child: TextField(
                          controller: countrycode,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(border: InputBorder.none, hintText: "+91"),
                        ),
                      ),

                      Text(
                        "|",
                        style: TextStyle(
                            fontSize: 40, color: Colors.teal[500]
                        ),
                      ),

                      Expanded(
                          child:
                          TextField(
                            controller: mobileNo,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10)
                            ],
                            onChanged: (value){

                            },
                            decoration: InputDecoration(border: InputBorder.none,
                              hintText: "Mobile Number",
                            ),
                            keyboardType: TextInputType.number,
                          )
                      )
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: () async{
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>MobileOTP()));
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
                    //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));

                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countrycode.text + mobileNo.text}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        MobileLogin.verify=verificationId;
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpScreen()));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                    child: Text("Send the OTP "),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.teal[500],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
// Future<void> storeTokenAndData(UserCredential userCredential) async{
//   await storage.write(key: "token", value: userCredential.credential.token.toString());
//   await storage.write(key: "userCredential", value: userCredential.credential.toString());
// }