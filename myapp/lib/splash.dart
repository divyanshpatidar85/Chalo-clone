import 'dart:async';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:myapp/content.dart';
import 'package:myapp/main.dart';
class Splash extends StatefulWidget{
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override

void initState(){
  super.initState();
  Timer(Duration(seconds: 3), () { 
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
      return MyHomePage(title:'CHALO');
    } ,
    )
    );
  });
}
  
  
   
  
  @override
  Widget build(BuildContext context) {

   return Scaffold(
    backgroundColor:Colors.white,
    body:Center(
    child:Image.asset('assets/images/chalo_png.png'),
      )
   );
  }
}