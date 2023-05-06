

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:visachatbot/home/components/categories.dart';

// import '../components/custom_navigation_bar.dart';
// import '../enums.dart';
// import '../size_config.dart';
// import 'components/SuggesstionBanner.dart';
// import 'components/addbanner.dart';
// import 'components/home_header.dart';
// import 'components/middleparts.dart';

// class HomeScreen extends StatelessWidget {
//   static String routeName = "/home";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:SingleChildScrollView(child: Body()),
//       bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home), ////////////
//     );
//   }
// }
// class Body extends StatelessWidget {
//   User? user = FirebaseAuth.instance.currentUser;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SingleChildScrollView(

//         child: Column(
//           children: [
//             SizedBox(height: getProportionateScreenWidth(25)),
//             HomeHeader(),
//             SizedBox(height: getProportionateScreenWidth(25)),
//             DiscountBanner(),
//              Categories(),
//             SizedBox(height: getProportionateScreenWidth(25)),
//            // CardWidget(),
//            //  Padding(
//            //    padding: const EdgeInsets.all(8.0),
//            //    child: SingleChildScrollView(
//            //      child: Container(
//            //        child: StreamBuilder(
//            //          stream: FirebaseFirestore.instance.collection('users').doc(user!.uid).collection("Result").snapshots(),
//            //          builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
//            //
//            //            if(snapshot.hasData){
//            //              return ListView.builder(
//            //                  itemCount: snapshot.data!.docs.length,
//            //                  itemBuilder: (context,index){
//            //                    var data=snapshot.data!.docs[index].data() as Map<String,dynamic>;
//            //                    return Padding(
//            //                      padding: const EdgeInsets.all(10.0),
//            //                      child: SingleChildScrollView(
//            //                        child: Container(
//            //                          //margin: const EdgeInsets.all(10),
//            //                          padding: const EdgeInsets.all(10),
//            //                          // height: 200,
//            //                          // color: Colors.amberAccent,
//            //                          height: MediaQuery.of(context).size.height *1/4,
//            //                          width: MediaQuery.of(context).size.height *1/3,
//            //                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(width: 2, color: Colors.teal),color: Colors.teal[50]),
//            //
//            //
//            //                          child: SingleChildScrollView(
//            //                            child: Padding(
//            //                              padding: const EdgeInsets.only(left: 5,top: 8.0),
//            //                              child: Column(
//            //                                //mainAxisAlignment: MainAxisAlignment.center,
//            //
//            //                                crossAxisAlignment: CrossAxisAlignment.start,
//            //                                children: [
//            //                                  Text(
//            //                                    " Name :"+snapshot.data?.docs[index]['Patient Name'],
//            //                                    style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),),
//            //                                  const SizedBox(
//            //                                    height: 5,
//            //                                  ),
//            //
//            //                                  Text(
//            //                                    "Age & Gender :"+snapshot.data?.docs[index]['Age & Sex'],
//            //                                    style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
//            //                                  ),
//            //                                  const SizedBox(
//            //                                    height: 5,
//            //                                  ),
//            //                                  // Text(
//            //                                  //   "Location :"+snapshot.data?.docs[index]['location'],
//            //                                  //   style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
//            //                                  // ),
//            //                                  const SizedBox(
//            //                                    height: 5,
//            //                                  ),
//            //                                  Text(
//            //                                    "Contact no :"+snapshot.data?.docs[index]['mobileno'],
//            //                                    style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
//            //                                  ),
//            //                                  const SizedBox(
//            //                                    height: 5,
//            //                                  ),
//            //                                ],
//            //                              ),
//            //                            ),
//            //                          ),
//            //                        ),
//            //                      ),
//            //                    );
//            //                    return Container();
//            //                  }
//            //
//            //              );
//            //
//            //            }
//            //            return Container();
//            //
//            //          },
//            //        ),
//            //      ),
//            //    ),
//            //  ),
//             EcommerceImage(),

//             SizedBox(height: getProportionateScreenWidth(30)),
//             //PopularProducts(),
//             SizedBox(height: getProportionateScreenWidth(30)),
//             //
//           ],
//         ),
//       ),
//     );
//   }
// }
