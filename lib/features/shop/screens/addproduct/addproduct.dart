import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(32),
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/notifi.png"),
            fit: BoxFit.cover,
          )),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              const SizedBox(height: 15),
              const Text("Describe your item", style: TextStyle(fontSize: 25)),
              const SizedBox(height: 25),
              const Text(
                "ITEM NAME*",
                style: TextStyle(fontSize: 15),
              ),
              const TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ' Give your item a name ',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))))),
              const SizedBox(height: 15),
              const Text(
                "ITEM DESCRIPTION*",
                style: TextStyle(fontSize: 15),
              ),
              TextFormField(
                  minLines: 1,
                  maxLines: 6,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText:
                          ' Describe your item such as (Overview , Features , Additional Info , And more...)',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))))),
              const SizedBox(height: 15),
              const Text(
                "ITEM QUANTITY*",
                style: TextStyle(fontSize: 15),
              ),
              const TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ' Enter item quantity ',
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))))),
              const SizedBox(height: 15),
              const Text(
                "ITEM PRICE*",
                style: TextStyle(fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Daily Rate',
                        contentPadding: const EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter daily rate',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Weekly Rate',
                        contentPadding: const EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter weekly rate',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Monthly Rate',
                        contentPadding: const EdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter monthly rate',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              const Text(
                "ITEM AVAILABILITY*",
                style: TextStyle(fontSize: 15),
              ),
              const TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ' Choose item availability date ',
                      suffixIcon: Icon(Icons.date_range),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))))),
              const SizedBox(height: 15),
              const Text(
                "ITEM PHOTO*",
                style: TextStyle(fontSize: 15),
              ),
              const TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ' Upload item photo ',
                      suffixIcon: Icon(Icons.photo_camera),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15))))),
              const SizedBox(height: 15),
              ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfffecf59),
                  ),
                  child: const Text(
                    "Post",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ))
            ],
          )),
    );
  }
}
