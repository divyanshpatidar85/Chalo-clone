 import 'package:flutter/cupertino.dart';

AnimatedContainer PageViewImages(height, _controller) {
    return AnimatedContainer(
              height: height*.3,
              duration: Duration(seconds: 5),
              // color:Colors.white70,
              decoration:BoxDecoration(
                //  border:Border.all(color:Colors.black),
                boxShadow:[]
              ),
              child:PageView(
              controller:_controller,
              children: [
                    Image.asset('assets/images/card.png',fit:BoxFit.cover,),
                    Image.asset('assets/images/pass.png',fit:BoxFit.cover),
              ],
              ),
              
            );
  }
