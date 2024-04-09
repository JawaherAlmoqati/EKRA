import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyRentalSc extends StatefulWidget {
  const MyRentalSc({super.key});

  @override
  State<MyRentalSc> createState() => _HomePageState();
}

class _HomePageState extends State<MyRentalSc> {
  bool _showOwnedList = true;
  bool _showOwnedListChoice = true; // true for 'Own', false for 'Request'
  bool _showRentedListChoice = true; // true for 'Rent', false for 'Request'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.blueAccent,
        color: Colors.white,
        items: const <Widget>[
          Icon(Icons.home_filled, size: 30),
          Icon(Icons.favorite, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: 5.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('Own', _showOwnedList, true),
                    _buildButton('Request', _showOwnedList, false),
                  ],
                ),
              ),
              SizedBox(
                  height: 1
                      .h), // Add some space between the button row and additional choices
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildSubButton('Rent', _showOwnedListChoice, true),
                  _buildSubButton('Request', _showOwnedListChoice, false),
                ],
              ),
              SizedBox(
                  height: 1
                      .h), // Add some space between the button row and additional choices
              Expanded(
                child: _showOwnedList
                    ? _showOwnedListChoice
                        ? ListView(children: _buildOwnListOne())
                        : ListView(children: _buildOwnListTwo())
                    : !_showRentedListChoice
                        ? ListView(children: _buildRentListOne())
                        : ListView(children: _buildRentListTwo()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, bool isSelectedList, bool isSelectedChoice) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showOwnedList = text == 'Own';
          _showOwnedListChoice = isSelectedChoice;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: 40.w,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelectedChoice ? Colors.white : Colors.grey.withOpacity(0.5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(
            color:
                isSelectedList ? Colors.black : Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Widget _buildSubButton(
      String text, bool isSelectedListChoice, bool isSelectedChoice) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showRentedListChoice = isSelectedChoice;
        });
      },
      child: Container(
        width: 40.w,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: isSelectedListChoice && isSelectedChoice
              ? const Border(bottom: BorderSide(width: 2, color: Colors.black))
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelectedListChoice
                ? isSelectedChoice
                    ? Colors.black
                    : Colors.black.withOpacity(0.5)
                : Colors.black.withOpacity(0.5),
            decoration: isSelectedListChoice && isSelectedChoice
                ? TextDecoration.underline
                : null,
          ),
        ),
      ),
    );
  }

  List<Widget> _buildOwnListOne() {
    return [
      const ListTile(title: Text('Own List Two Item 1')),
      const ListTile(title: Text('Own List Two Item 2')),
      const ListTile(title: Text('Own List Two Item 3')),
    ];
  }

  List<Widget> _buildOwnListTwo() {
    return [
      const ListTile(title: Text('Own List Two Item 1')),
      const ListTile(title: Text('Own List Two Item 2')),
      const ListTile(title: Text('Own List Two Item 3')),
    ];
  }

  List<Widget> _buildRentListOne() {
    return [
      const ListTile(title: Text('Rent List One Item 1')),
      const ListTile(title: Text('Rent List One Item 2')),
      const ListTile(title: Text('Rent List One Item 3')),
    ];
  }

  List<Widget> _buildRentListTwo() {
    return [
      const ListTile(title: Text('Rent List Two Item 1')),
      const ListTile(title: Text('Rent List Two Item 2')),
      const ListTile(title: Text('Rent List Two Item 3')),
    ];
  }

  // List<Widget> _buildOwnListOne() {
  //   return [
  //     FutureBuilder<QuerySnapshot>(
  //       future: FirebaseFirestore.instance.collection('your_collection_name').get(),
  //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //         if (snapshot.connectionState == ConnectionState.waiting) {
  //           return CircularProgressIndicator(); // Display a loading indicator while data is being fetched
  //         }
  //         if (snapshot.hasError) {
  //           return Text('Error: ${snapshot.error}');
  //         }
  //         return ListView(
  //           children: snapshot.data!.docs.map((DocumentSnapshot document) {
  //             Map<String, dynamic> data = document.data() as Map<String, dynamic>;
  //             return ListTile(
  //               title: Text(data['name']),
  //               subtitle: Text(data['description']),
  //             );
  //           }).toList(),
  //         );
  //       },
  //     ),
  //   ];
  // }
}
