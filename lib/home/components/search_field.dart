import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

import '../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);
  Widget buildAnimatedText(String text)=>Container(
    width: SizeConfig.screenWidth * 0.7,
    //height: 60,
    //height: 80,
    color: Colors.teal[50],
    margin: EdgeInsets.all(5),
    child: Marquee(
      text: text,
      style: TextStyle(
        fontSize: getProportionateScreenWidth(25),
        color: Colors.teal[400],
        fontWeight: FontWeight.bold,
      ),
      blankSpace: 160,
      velocity: -150,
      pauseAfterRound: Duration(seconds: 2),
    ),
  );


  @override

  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.7,
      height: 60,
      decoration: BoxDecoration(
        //color: kSecondaryColor.withOpacity(0.1),
        //color: Colors.yellowAccent,
        color: Colors.teal[50],


        borderRadius: BorderRadius.circular(15),
      ),
      // child: TextField(
      //   onChanged: (value) => print(value),//////   IMP
      //   decoration: InputDecoration(
      //       contentPadding: EdgeInsets.symmetric(
      //           horizontal: getProportionateScreenWidth(20),
      //           vertical: getProportionateScreenWidth(9)),
      //       border: InputBorder.none,
      //       focusedBorder: InputBorder.none,
      //       enabledBorder: InputBorder.none,
      //       hintText: "Search product",
      //       prefixIcon: Icon(Icons.search_rounded)
      //   ),
      //
      //
      // ),
      // child: Container(
      //
      //   padding: const EdgeInsets.all(5.0),
      //   child: Text.rich(
      //     //textAlign: TextAlign.left,
      //     TextSpan(
      //
      //       children: [
      //         TextSpan(
      //           text: 'Krishak Farma\n',
      //           style: TextStyle(
      //             fontSize: getProportionateScreenWidth(25),
      //             color: Colors.deepOrangeAccent,
      //             fontWeight: FontWeight.bold,
      //           ),
      //         ),
      //         TextSpan(text: "Welcome User!\n",),
      //       ]
      //     )
      //
      //   ),
      // ),
      // child: Container(
      //   margin: EdgeInsets.all(24),
      //   child:,
      // ),
      child: buildAnimatedText("Health Plus"),



    );
    // return Container(
    //   // height: 90,
    //   width: SizeConfig.screenWidth * 0.6,
    //   //margin: EdgeInsets.all(getProportionateScreenWidth(20)),
    //   // padding: EdgeInsets.symmetric(
    //   //   horizontal: getProportionateScreenWidth(20),
    //   //   vertical: getProportionateScreenWidth(15),
    //   // ),
    //   decoration: BoxDecoration(
    //     //color: Color(0xFF4A3298),
    //     color:Colors.deepOrangeAccent,
    //     borderRadius: BorderRadius.circular(15),
    //   ),
    //   child: Text.rich(
    //     TextSpan(
    //       style: TextStyle(color: Colors.white),
    //       children: [
    //         TextSpan(
    //           text: "Get Best Market Price",
    //           style: TextStyle(
    //             fontSize: getProportionateScreenWidth(24),
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //         TextSpan(text: "Publish Your Product Worldwide !\n"),
    //
    //       ],
    //     ),
    //   ),
    // );

  }
}
