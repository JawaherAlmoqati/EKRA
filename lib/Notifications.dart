import 'package:flutter/material.dart';

void main() {
  runApp(const MyNoti());
}

class MyNoti extends StatelessWidget {
  const MyNoti({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
            padding: EdgeInsets.all(24),
            children: [
              Text(
                "My Notifications",
                style: TextStyle(fontSize: 29),
              ),
            ],
          )),
    );
  }
}
