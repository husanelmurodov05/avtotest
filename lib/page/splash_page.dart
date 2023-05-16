import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
     Navigator.push(context,MaterialPageRoute(builder: (context)=>HomePage()));
     });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      backgroundColor: Color(0xFF145FC2),
      body: Center(
        child: Image(
          width: 250,
          height: 250,      
          image: AssetImage("assets/avtotest.png")),
      ),
    );
  }
}
