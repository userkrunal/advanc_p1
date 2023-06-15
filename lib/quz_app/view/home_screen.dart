import 'dart:math';

import 'package:advanc_p1/quz_app/model/quz_model.dart';
import 'package:advanc_p1/quz_app/provider/quez_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class QuezScreen extends StatefulWidget {
  const QuezScreen({Key? key}) : super(key: key);

  @override
  State<QuezScreen> createState() => _QuezScreenState();
}

class _QuezScreenState extends State<QuezScreen> {
  QuezProvider? qpT;
  QuezProvider? qpF;
  @override
  Widget build(BuildContext context) {
    qpF=Provider.of<QuezProvider>(context,listen: false);
    qpT=Provider.of<QuezProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      body:FutureBuilder(
        future: qpF!.QuezApi(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
            {
              return Text("${snapshot.error}");
            }
          else if(snapshot.hasData)
            {
              QuezModel quezModel=snapshot.data!;
              List? quezList=quezModel.results![0].incorrectAnswers;
              quezList?.add(quezModel.results![0].correctAnswer);
              // Random rnd=Random();
              // quezList = rnd.toList();
              return  Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 3,right: 3,top: 5),
                    child: Container(
                      height: 40.h,
                      width: 100.w,
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.elliptical(100,70),bottomRight: Radius.elliptical(100,70),topLeft: Radius.circular(40),topRight: Radius.circular(40)),color: Colors.purpleAccent.shade100),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40,left: 20),
                        child: Text("Quez App",style: TextStyle(fontSize: 20.w,color: Colors.white)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:200,left: 20),
                    child: Container(
                      height: 25.h,
                      width: 90.w,
                      decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.purpleAccent,offset: Offset(3, 5),blurStyle: BlurStyle.outer)],borderRadius: BorderRadius.circular(30),color: Colors.white),
                      child: Center(child: Container(height: 100,width: 300,child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${quezModel.results![qpT!.i].question}",style: TextStyle(fontSize: 23,)),
                      ))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 450,left: 25,right: 15),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              qpF!.changeQuestion();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 7.h,width:80.w,decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.purpleAccent.shade200,spreadRadius: 3)],color: Colors.white,borderRadius: BorderRadius.circular(30)),
                                child: Center(child: Text("  ${quezModel.results![qpF!.i].incorrectAnswers![0]}",style: TextStyle(fontSize: 23),)),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              qpF!.changeQuestion();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 7.h,width:80.w,decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.purpleAccent.shade200,spreadRadius: 3)],color: Colors.white,borderRadius: BorderRadius.circular(30)),
                                child: Center(child: Text("  ${quezModel.results![qpF!.i].incorrectAnswers![1]}",style: TextStyle(fontSize: 23))),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              qpF!.changeQuestion();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 7.h,width:80.w,decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.purpleAccent.shade200,spreadRadius: 3)],color: Colors.white,borderRadius: BorderRadius.circular(30)),
                                child: Center(child: Text("  ${quezModel.results![qpF!.i].incorrectAnswers![2]}",style: TextStyle(fontSize: 23))),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              qpF!.changeQuestion();
                              qpT!.ansList?.add(quezModel.results![0].correctAnswer);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(height: 7.h,width:80.w,decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.purpleAccent.shade200,spreadRadius: 3)],color: Colors.white,borderRadius: BorderRadius.circular(30)),
                                child: Center(child: Text("  ${quezModel.results![qpF!.i].correctAnswer}",style: TextStyle(fontSize: 23))),
                              ),
                            ),
                          ),

                          // Expanded(
                          //   child: InkWell(
                          //     onTap: () {
                          //       qpF!.changeQuestion();
                          //     },
                          //     child: ListView.builder(itemBuilder: (context, index) {
                          //       return Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Container(height: 7.h,width:80.w,decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.purpleAccent.shade200,spreadRadius: 3)],color: Colors.white,borderRadius: BorderRadius.circular(30)),
                          //            child: Center(child: Text("${quezModel.results![qpF!.i].incorrectAnswers![index]}")),
                          //          ),
                          //       );
                          //     },itemCount: quezModel.results![0].incorrectAnswers!.length,),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                ],
              );
            }
          return Center(child: CircularProgressIndicator());
        },
      )
    ));
  }
}
