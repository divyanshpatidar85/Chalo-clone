import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:myapp/content.dart';
// import 'package:myapp/profileCircle.dart';
import 'package:myapp/splash.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'OneToOneLocationKeNicche.dart';
import 'SearchBarKeNIche.dart';
import 'appBarWithDrawer.dart';
import 'drawer_function.dart';
import 'home_screen(1).dart';
import 'BussPassWalaWidgit';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// // ignore: unused_import
// import "dart:ffi";
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: dprimarycolor,
        // primarySwatch:Colors.dprimarycolor,
      ),
      home: Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  RefreshController refreshController=RefreshController(initialRefresh: true);

getUsers() {
  Visibility:false;
  setState(() {
    
  });
  Future.delayed(Duration(seconds: 2));
  setState(() {
    initState();
  });
}


 static const LatLng sourceLocation=LatLng(22.797442880728724, 75.92700079715436);
  static const LatLng destination=LatLng(22.752187, 75.890453);
final Completer<GoogleMapController>_controller=Completer();

  
  List<LatLng>polylineCoordinates=[];
  LocationData? currentLocation;
  BitmapDescriptor sourceIcon=BitmapDescriptor.defaultMarker;
   BitmapDescriptor destinationIcon=BitmapDescriptor.defaultMarker;
    BitmapDescriptor currentIcon=BitmapDescriptor.defaultMarker;
  

  void getCurrentLocation() async{
 
    Location location=Location();
    location.getLocation().then((location){
  currentLocation=location;
    }, );
       GoogleMapController googleMapController=await _controller.future;
    location.onLocationChanged.listen((newLoc) {
      currentLocation=newLoc;
      googleMapController.animateCamera(CameraUpdate.newCameraPosition((CameraPosition(
        zoom:13.5,
        target: LatLng(newLoc.latitude!,newLoc.longitude!)))));
      setState(() {
        
      });
     });
  }
  void getPolyPoints() async{
    PolylinePoints polylinePoints=PolylinePoints();
    PolylineResult result= await polylinePoints.getRouteBetweenCoordinates(google_api_key,
    PointLatLng(sourceLocation.latitude,sourceLocation.longitude),
    PointLatLng(destination.latitude,destination.longitude)
    );
    if(result.points.isNotEmpty){
     
        result.points.forEach((PointLatLng point)=>polylineCoordinates.add(
          LatLng(point.latitude, point.longitude)
        ));
     setState(() {
       
     });
      
      
     
    }
  }

@override
  void initState() {
    getPolyPoints();
   
    getCurrentLocation();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var size, height, width;
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    final _controller;
    _controller = PageController();
    return Scaffold(
      drawer: drawer_with_functionality(),
      appBar: AppBarWithSideDrawer(),
      body: SmartRefresher(
        controller: refreshController,
         enablePullDown:true,
        // ignore: prefer_const_constructors
        header:WaterDropHeader(
          
          complete:Container(),
          completeDuration: Duration.zero,
        ) ,
        onRefresh:() => getUsers(),
        // controller: null,
        child: SingleChildScrollView(
          scrollDirection:Axis.vertical,
          child: Column(
            children: [
              search_bar_down_to_appbar(height, width),
              
               SizedBox(
                height: 20,
              ),
              Container(      decoration:BoxDecoration(
                  border:Border.all(color:Colors.black)),
                child: OneToOneLocation()),
              Container(
                color:Colors.blueAccent.withOpacity(0.1),
                height: 40,
              ),
              PageViewImages(height, _controller),
              
              SizedBox(
                height: 20,
              ),
              smoothPageIndicator(_controller),
              SizedBox(
                height: 10,
              ),
               Container(
                color:Colors.black.withOpacity(0.2),
                height: 2,
              ),
              //==============X--------------Bus Ticket and passes
              Container(
               
                height:300,
                // color:Colors.amber,
               child:Column(
                 children: [
                   Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      
                      
                       Padding(
                         padding: const EdgeInsets.only(top:10),
                         child: Text('Buy bus ticket / pass',style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                       ),
                        TextButton(onPressed:(){},
                           child: Text('See All',style:TextStyle(color:Colors.orange,fontSize: 17),)),
                      
                    ],
                    ),
                      Wrap(
                        spacing: 1,
                        runSpacing: 5,
                        children: [
                      
                          BusPassWalaWidgit(iconn:FaIcon(FontAwesomeIcons.ticket),Titlee:'Bus Pass',),
                        
                           BusPassWalaWidgit(iconn:FaIcon(FontAwesomeIcons.moneyBillTransfer),Titlee:'Card Recharge',),
                           
                            BusPassWalaWidgit(iconn:FaIcon(FontAwesomeIcons.rupeeSign),Titlee:'Pay for ticket',),
                         
                        ],
                        )
                 ],
               )
              ),
               Container(
                height: 400,
                width: width*0.8,
                child:currentLocation==null ? const Center(child:Text('Loading'),): GoogleMap(initialCameraPosition:CameraPosition(target:LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          zoom: 13.5,
          ),
         
          markers: {
      
         Marker( markerId:const MarkerId("currentlocation"),
         icon:BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position:LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
        ),
           
          },
           onMapCreated:(GoogleMapController){
        _controller.Completer(GoogleMapController);
        initState();
        setState(() {
          initState();
        });
           },
        polylines:{
          Polyline(
        polylineId: const PolylineId("route"),
          visible: true,
          points: polylineCoordinates,    // color:Color.fromARGB(255, 141, 64, 64),
          // width:150, 
          )},
          ),
          )
          
            ],
          ),
        ),
      ),
    );
  }

  SmoothPageIndicator smoothPageIndicator(_controller) {
    return SmoothPageIndicator(
      controller: _controller,
      count: 2,
      effect: SlideEffect(
        dotColor: Colors.grey,
        activeDotColor: Colors.blue.withOpacity(0.8),
      ),
    );
  }
}

