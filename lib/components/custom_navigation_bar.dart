
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:visachatbot/components/message.dart';


// import '../constants.dart';
// import '../enums.dart';
// import '../home/icon_but_with_cnt.dart';
// import '../profile/profile_screen.dart';


// class CustomBottomNavBar extends StatelessWidget {
//   const CustomBottomNavBar({
//     Key? key,
//     required this.selectedMenu,
//   }) : super(key: key);

//   final MenuState selectedMenu;

//   @override
//   Widget build(BuildContext context) {
//     final Color inActiveIconColor = Color(0xFFB6B6B6);
//     return Container(
//       padding: EdgeInsets.symmetric(vertical: 14),
//       decoration: BoxDecoration(
//         color: Colors.teal[50],
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, -15),
//             blurRadius: 20,
//             color: Color(0xFFDADADA).withOpacity(0.15),
//           ),
//         ],
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(40),
//           topRight: Radius.circular(40),
//         ),
//       ),
//       child: SafeArea(
//           top: false,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               IconButton(
//                 icon: SvgPicture.asset(
//                   ("assets/icons/Shop Icon.svg"),
//                   color: MenuState.home == selectedMenu
//                       ? Colors.teal
//                       : inActiveIconColor,
//                 ),
//                 onPressed: () {},
//                // onPressed: () =>
//                    // Navigator.pushNamed(context, HomeScreen.routeName),
//               ),
//               // IconButton(
//               //   icon: SvgPicture.asset("assets/icons/Bell.svg"),
//               //
//               //   onPressed: () {
//               //     //Navigator.of(context).push(MaterialPageRoute(builder:(context)=> AddProduct()),);/// put Search class after done
//               //     //Navigator.pushNamed(context, Notifications.routeName);//// notification screen
//               //     Navigator.of(context).push(MaterialPageRoute(builder:(context)=> Notifications()),);
//               //   },
//               //
//               // ),
//               IconButton(
//                 //svgSrc: "assets/icons/Bell.svg",
//                 icon: SvgPicture.asset("assets/icons/Bell.svg"),
//                 //numOfitem: 1, // here we have to edit
//                  //press: () =>  Navigator.of(context).push(MaterialPageRoute(builder:(context)=> Notifications()),),
//                 //press: () =>  Navigator.of(context).push(MaterialPageRoute(builder:(context)=> MarketView()),),
//                 onPressed: () {  },
//               ),
//               IconButton(
//                 icon: SvgPicture.asset("assets/icons/Conversation.svg"),

//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(builder:(context)=> Chat()),);
//                   //Navigator.pushNamed(context, Chat.routeName);
//                 },
//               ),
//               IconButton(
//                 icon: SvgPicture.asset(
//                   "assets/icons/User Icon.svg",
//                   // color: MenuState.profile == selectedMenu
//                   //     ? kPrimaryColor
//                   //     : inActiveIconColor,
//                 ),
                // onPressed: () =>Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen())),
//                 //onPressed: () =>
//                 //Navigator.pushNamed(context, ProfileScreen.routeName),
//               ),
//             ],
//           )),
//     );
//   }
// }

