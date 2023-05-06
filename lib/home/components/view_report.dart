import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:visachatbot/home/components/view_full_report.dart';

import '../icon_but_with_cnt.dart';

class ViewUserReport extends StatefulWidget {
  const ViewUserReport({Key? key}) : super(key: key);

  @override
  State<ViewUserReport> createState() => _ViewUserReportState();
}

class _ViewUserReportState extends State<ViewUserReport> {
  User? user = FirebaseAuth.instance.currentUser;
  late Map<String, dynamic> mp;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Your Reports"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("users")
              .doc(user!.uid)
              .collection("Reports")
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data() as Map<
                        String,
                        dynamic>;
                    return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SingleChildScrollView(
                        child: Container(
                        //margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                    // height: 200,
                    // color: Colors.amberAccent,
                    height: MediaQuery.of(context).size.height *1/4,
                    width: MediaQuery.of(context).size.height *1/3,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border: Border.all(width: 2, color: Colors.teal),color: Colors.teal[50]),


                    child: SingleChildScrollView(
                    child: Padding(
                    padding: const EdgeInsets.only(left: 5,top: 8.0),
                    child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(
                        "Patient Name :"+snapshot.data?.docs[index]['Patient Name'],
                        style: TextStyle(color: Colors.teal,fontSize: 15),
                      ),
                    Text(
                    "Age & Gender :"+snapshot.data?.docs[index]['Age & Sex'],
                    style: TextStyle(color: Colors.teal,fontSize: 15),),
                    const SizedBox(
                    height: 5,
                    ),


                      // double.tryParse(snapshot.data?.docs[index]['Monocytes']).toString()
                      // Map<String, double> mp
                      // {
                      //   "Basophils" :
                      //   snapshot.data?.docs[index]['Basophils'].toString(),
                      //   mp['Monocytes'] =
                      //   snapshot.data?.docs[index]['Monocytes'],
                      //   mp['Haemoglobin'] =
                      //   snapshot.data?.docs[index]['Haemoglobin'],
                      //   mp['Eisonophils'] =
                      //   snapshot.data?.docs[index]['Eiosinophils'],
                      //   mp['Haematocrit (HCT)'] =
                      //   snapshot.data?.docs[index]['Haematocrit (HCT)'],
                      //   mp['Lymphocytes'] =
                      //   snapshot.data?.docs[index]['Lymphocytes'],
                      //   mp['MCH'] = snapshot.data?.docs[index]['MCH'],
                      //   mp['MCHC'] = snapshot.data?.docs[index]['MCHC'],
                      //   mp['MCV'] = snapshot.data?.docs[index]['MCV'],
                      //   mp['Neutrophils'] =
                      //   snapshot.data?.docs[index]['Neutrophils'],
                      //   mp['Platelet Count'] =
                      //   snapshot.data?.docs[index]['Platelet Count'],
                      //   mp['RBC count'] =
                      //   snapshot.data?.docs[index]['RBC count'],
                      //   mp['RDW'] = snapshot.data?.docs[index]['RDW'],
                      //   mp['Total WBC Count'] =
                      //   snapshot.data?.docs[index]['Total WBC Count'],
                      // }
                      const SizedBox(
                    height: 5,
                    ),
                    // Text(
                    //   "Location :"+snapshot.data?.docs[index]['location'],
                    //   style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
                    // ),
                    const SizedBox(
                    height: 5,
                    ),
                    // Text(
                    //   "Contact no :"+snapshot.data?.docs[index]['mobileno'],
                    //   style: TextStyle(color: Colors.deepOrangeAccent,fontSize: 15),
                    // ),
                    const SizedBox(
                    height: 5,
                    ),
                    IconBtnWithCounter(
                    svgSrc: "assets/icons/receipt.svg",
                    press: () {
                    Navigator.push(context, MaterialPageRoute(builder:(context)=> ViewReport(data)));

                    }
                    ),

                    ],
                    ),
                    ),
                    ),
                    ),
                        )
                    );


                  }

              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
