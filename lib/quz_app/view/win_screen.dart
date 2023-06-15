import 'package:flutter/material.dart';

class WonScreen extends StatefulWidget {
  const WonScreen({Key? key}) : super(key: key);

  @override
  State<WonScreen> createState() => _WonScreenState();
}

class _WonScreenState extends State<WonScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(child: Text("You Won The Game",style: TextStyle(fontSize: 30))),
    ));
  }
}
