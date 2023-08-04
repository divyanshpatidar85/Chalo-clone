

import 'package:flutter/material.dart';
import 'package:myapp/profileCircle.dart';
import 'content.dart';
 AppBar AppBarWithSideDrawer() {
  // Float:false;
    return AppBar(
      
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      
      backgroundColor: backgrndcolor,
        leading:Builder(builder:(BuildContext context){
           return CircleAvatar(
          radius:1,
          backgroundColor: Colors.white,
          
          child: InkWell(
            onTap:(){
              Scaffold.of(context).openDrawer();
            },
            child: profileCircle(),
          )
     
      );;  
             },
        ),
        title: Text('CHALO',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 28,),),
   
     
    );
  }


