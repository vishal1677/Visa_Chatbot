import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visachatbot/MobileAuth/mobileauth.dart';
import 'package:visachatbot/home/home_screen.dart';
import 'package:visachatbot/sign_in/sign_in_screen.dart';
import 'package:visachatbot/components/message.dart';
import '../components/testChat.dart';
import '../size_config.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splash";
  const SplashScreen({Key? key}) : super(key: key);
  //static String routeName="/splash";
  //static String routeName="/splash";
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var auth = FirebaseAuth.instance;
  var isLogin = false;
  checkIfLogin() async {
    auth.authStateChanges().listen((User? user) {
      if (user != null && mounted) {
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  void initState() {
    checkIfLogin();
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(
        Duration(milliseconds: 5000), () {}); // await for 1.5 seconds

    //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> SignInScreen()));
    if (isLogin == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Chat()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignInScreen()));
      //Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> MobileLogin()));
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            margin: EdgeInsets.only(left: 25, right: 25),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Image.asset("assets/images/healthcare-loader.gif", height: 300, width: 300,alignment: Alignment.topCenter,),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Visa Chat Bot",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[500]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )));
  }
}
