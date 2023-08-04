import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Listview extends StatefulWidget {
  const Listview({
    super.key, required this.text, required this.iconn, required this.press,
  });
  final String text;
  final FaIcon iconn;
  final Function press;

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  @override
  Widget build(BuildContext context) {
    return 
       ListTile(
          leading:widget.iconn,
          title:Text('${widget.text}'),
          onTap:(){
          setState(() {
              // Color.fromARGB(10, 20, 30, 40);
            });
          },
    
    );
  }
}
