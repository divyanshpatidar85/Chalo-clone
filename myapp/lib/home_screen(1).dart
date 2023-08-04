import 'package:flutter/material.dart';

import 'content.dart';
SingleChildScrollView search_bar_down_to_appbar(height, width) {
    return SingleChildScrollView(
      child: Stack(children: [
        Container(
          height:height*0.09,
          width: width,
          color:backgrndcolor,
        ),
        Padding(
          padding: const EdgeInsets.only(left:kDefaultPadding*.9,top:kDefaultPadding*2.5),
          child: Container(
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius:BorderRadius.circular(20),
              boxShadow:[
                BoxShadow(
                   color: backgrndcolor.withOpacity(0.4), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 2),
                )
              ]
            ),
            height:height*0.06,
            width: width*0.9,
            child:Container(
              height:height*0.07,
             
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left:9.0),
                  child: TextField(
                     
                    decoration: InputDecoration(
                      hintText : 'Enter destination or bus number',
                      prefixIcon:Icon(Icons.search),
                      enabledBorder:InputBorder.none,
                      focusedBorder: InputBorder.none,
                  ),
                   onTap:(){},
                  
                  ),
                ),
              ),
            ),
            
          ),
        )
      ],),
    );
  }

