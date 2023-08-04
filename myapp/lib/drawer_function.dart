import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:myapp/content.dart';

import 'ListViewWithAction.dart';

Drawer drawer_with_functionality() {
  return Drawer(
    elevation: 0,
    child: ListView(
      children: [
        UserAccountsDrawerHeader(
          accountName: Text(
            'Divyansh Patidar',
            style: TextStyle(color: Colors.black),
          ),
          accountEmail: Text('divyanshpatidar85@gmail.com',
              style: TextStyle(color: Colors.black)),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: CircleAvatar(
              radius: 33,
              backgroundImage: AssetImage('assets/images/profile_img1.jpg'),
            ),
          ),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.01),
              spreadRadius: 5, //spread radius
              blurRadius: 7, // blur radius
              offset: Offset(0, 2),
            )
          ]),
        ),
        Container(
          // height: 200,
          decoration: BoxDecoration(

              // color:Colors.black12,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 2),
                )
              ]),
          child: Column(
            children: [
              Listview(
                text: 'Bus Passes and Ticket',
                iconn: FaIcon(FontAwesomeIcons.ticket),
                press: () {
                  textcolor.green;
                },
              ),
              Listview(
                text: 'Chalo Pay Wallet',
                iconn: FaIcon(FontAwesomeIcons.wallet),
                press: () {},
              ),
              ListTile(
                leading: ImageIcon(AssetImage('assets/logo/bus_station.png')),
                title: Text('Stop and Station'),
                onTap: () {},
              ),
              Listview(
                text: 'Favorites',
                iconn: FaIcon(
                  FontAwesomeIcons.star,
                ),
                press: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          color: Colors.white,
        ),
        Container(
          // height: 200,
          decoration: BoxDecoration(

              // color:Colors.black12,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 2),
                )
              ]),
          child: Column(
            children: [
              Listview(
                text: 'Alerts',
                iconn: FaIcon(
                  FontAwesomeIcons.bell,
                ),
                press: () {},
              ),
              Listview(
                text: 'Support',
                iconn: FaIcon(
                  FontAwesomeIcons.question,
                ),
                press: () {},
              ),
              ListTileWithIcons(),
              Listview(
                text: 'Language',
                iconn: FaIcon(
                  FontAwesomeIcons.language,
                ),
                press: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 2,
          color: Colors.white,
        ),
        Container(
          // height: 200,
          decoration: BoxDecoration(

              // color:Colors.black12,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 5, //spread radius
                  blurRadius: 7, // blur radius
                  offset: Offset(0, 2),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Listview(
                text: 'Share With Friend',
                iconn: FaIcon(
                  FontAwesomeIcons.share,
                ),
                press: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 8),
                child: Text(
                  'Follow us on',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.facebook,
                          size: 42,
                        )),
                    InkWell(
                        onTap: () {},
                        child: FaIcon(
                          FontAwesomeIcons.twitter,
                          size: 42,
                        )),
                    InkWell(
                        onTap: () {},
                        child: FaIcon(
                          FontAwesomeIcons.instagram,
                          size: 42,
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 25),
                child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Terms and Conditions',
                      style: TextStyle(fontSize: 18),
                    )),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ],
    ),
  );
}

ListTile ListTileWithIcons() {
  return ListTile(
    leading: Icon(Icons.location_city),
    title: Text('Location'),
    onTap: () {},
  );
}
