//import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:visachatbot/MobileAuth/mobileauth.dart';
import 'package:visachatbot/loginsucessscreen/login_sucess_screen.dart';
import 'package:visachatbot/profile/profile_screen.dart';
import 'package:visachatbot/screens/splashscreen.dart';
import 'package:visachatbot/sign_in/sign_in_screen.dart';
import 'package:visachatbot/sign_up/sign_up_screen.dart';

import 'forgot_password/forgot_password_screen.dart';
import 'home/home_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  MobileLogin.routeName: (context) => MobileLogin(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  // 'home':(context)=>HomeScreen(),
  'login_sucess': (context) => LoginSuccessScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
};
