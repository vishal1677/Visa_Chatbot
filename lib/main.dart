import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:overlay_support/overlay_support.dart';
import 'package:visachatbot/routes.dart';
import 'package:visachatbot/screens/splashscreen.dart';

import 'firebase_options.dart';
import 'models/add_date.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); //// for add product
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  //await Firebase.initializeApp();

  // final storage=new FlutterSecureStorage();
  // Future<bool> checkLoginStatus() async{
  //   String?value =await storage.read(key: "uid");
  //   if(value==null){
  //     return false;
  //   }
  //   return true;// dash boars
  //
  // }
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    //Get.lazyPut(()=>DataClass());

    // TODO: implement build

    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Error");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return OverlaySupport(
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                initialRoute: SplashScreen.routeName,
                routes: routes,
              ),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
