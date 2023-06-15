import 'package:advanc_p1/product/provider/product_provider.dart';
import 'package:advanc_p1/product/view/home_screen.dart';
import 'package:advanc_p1/product/view/productin_screen.dart';
import 'package:advanc_p1/quz_app/provider/quez_provider.dart';
import 'package:advanc_p1/quz_app/view/home_screen.dart';
import 'package:advanc_p1/quz_app/view/win_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ProductProvider()),
      ChangeNotifierProvider(create: (context) => QuezProvider(),)
    ],
      child: Sizer(builder: (context, orientation, deviceType) {
       return  MaterialApp(
         debugShowCheckedModeBanner: false,
          routes: {
             '/':(context) => QuezScreen(),
            'win':(context) => WonScreen()
          },
       );
      },),
  )

  );
}