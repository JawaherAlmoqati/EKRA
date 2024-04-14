import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(const MyPost());
}

class MyPost extends StatelessWidget {
  const MyPost({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: PostPage(),
    );
  }
}

class PostPage extends StatelessWidget {
  const PostPage({super.key});

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
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/notifi.png"),
            fit: BoxFit.cover,
          )),
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              SizedBox(height: 15),
              Text("Describe your item", style: TextStyle(fontSize: 25)),
              SizedBox(height: 25),
              Text(
                "ITEM NAME*",
                style: TextStyle(fontSize: 15),
              ),
              TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ' Give your item a name ',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))))),
              SizedBox(height: 15),
              Text(
                "ITEM DESCRIPTION*",
                style: TextStyle(fontSize: 15),
              ),
              TextFormField(
                  minLines: 1,
                  maxLines: 6,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText:
                          ' Describe your item such as (Overview , Features , Additional Info , And more...)',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))))),
              SizedBox(height: 15),
              Text(
                "ITEM QUANTITY*",
                style: TextStyle(fontSize: 15),
              ),
              TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ' Enter item quantity ',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))))),
              SizedBox(height: 15),
              Text(
                "ITEM PRICE*",
                style: TextStyle(fontSize: 15),
              ),
              TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ' Enter item price ',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))))),
              SizedBox(height: 15),
              Text(
                "ITEM AVAILABILITY*",
                style: TextStyle(fontSize: 15),
              ),
              TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ' Choose item availability date ',
                      suffixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))))),
              SizedBox(height: 15),
              Text(
                "ITEM PHOTO*",
                style: TextStyle(fontSize: 15),
              ),
              TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ' Upload item photo ',
                      suffixIcon: Icon(Icons.photo_camera),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))))),
              SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Post",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xfffecf59),
                  ))
            ],
          )),
    );
  }
}
