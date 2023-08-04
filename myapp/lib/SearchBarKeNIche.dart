 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/content.dart';

SingleChildScrollView OneToOneLocation() {
    return SingleChildScrollView(
          scrollDirection:Axis.horizontal,
          child: Row(
            children: [
              location_to(Title:'From My Location',SubTitle:'TO M M Commodite',),
             
               location_to(Title:'From My Location',SubTitle:'TO Omaxe',),
                location_to(Title:'From My Location',SubTitle:'To Apj Abdual Kalam University',),
                 location_to(Title:'From My Location',SubTitle:'Toll Naka',),
            ],
          ),
        );
  }



class location_to extends StatelessWidget {
  const location_to({
    super.key, required this.Title, required this.SubTitle,
  });
   final String Title,SubTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:40,right: 20),
      child: Container(
        alignment:Alignment.center,
        height: 100,
        width: 250,
        margin:EdgeInsets.only(bottom:kDefaultPadding*1.6),
        decoration:BoxDecoration(
          border:Border.all(color:Colors.black),
          borderRadius:BorderRadius.circular(15),
          boxShadow:[
            BoxShadow(
               color: Colors.black.withOpacity(0.1),
               
               spreadRadius: 5, //spread radius
               blurRadius: 3, // blur radius
               offset: Offset(5,8),
            ),
            
          ]
        ),
        child: 
              ListTile(
                  
                  leading:ImageIcon(AssetImage('assets/logo/map.png')),
                  title:Text('$Title'),
                  subtitle: Text('$SubTitle'),
                  onTap: (){},
                ),
       
      ),
    );
  }
}