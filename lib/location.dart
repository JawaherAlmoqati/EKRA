import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyLoca());
}

class MyLoca extends StatelessWidget {
  const MyLoca({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home:  LocationPage(),
    );
  }
}

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});
  String _dropdowncities = ("Qassim");
  var _city= [
    "Qassim" ,
    "Riyadh",
    "Makkah",
    "Jeddah",
    "Madinah",
    "Al Khobar" 
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center (
        child: Container(
          width: 150,
          height: 80,
          decoration: BoxDecoration(color: Color(0xffebedfe), 
          borderRadius: BorderRadius.circular(10)), 
          child: Center(
            child: DropdownButton(items: _city.map(String city)){
              return DropdownMenuItem(
                value : city ,
                child: Text(city));
                


            }


          ),

        ),




      )
    );
  }
}
