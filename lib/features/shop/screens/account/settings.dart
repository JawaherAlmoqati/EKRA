import 'package:ekra/features/Authentication/screens/login/signin.dart';
import 'package:ekra/features/shop/models/setting.dart';
import 'package:ekra/features/shop/screens/home/widgets/setting_switch.dart';
import 'package:ekra/features/shop/screens/home/widgets/setting_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class settingsscreen extends StatefulWidget {
  const settingsscreen({super.key});
  
  @override
  State<settingsscreen> createState() => _settingsscreenstate();
  }

  class _settingsscreenstate extends State<settingsscreen> {
    bool isDarkMode = false;
    bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 30,
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const SizedBox(height: 45),
          const Divider(),
          const SizedBox(height: 10),
           Text
           ("Your Account",
           style: TextStyle(
            fontSize: 15,
            color:Colors.grey.shade600)),
            const SizedBox(height: 7,),
           Column(
            children: List.generate(
              settings.length,
               (index) => setting_tile(setting: settings[index])
               ),
               ),
           const SizedBox(height: 20),
           Text
           ("How you use Eddah",
           style: TextStyle(
            fontSize: 15,
            color:Colors.grey.shade600)),
            const SizedBox(height: 7,),
            SettingSwitch(
                title: "Notification",
                icon: Icons.notifications,
                value: isOn,
                onTap: (value) {
                  setState(() {
                    isOn = value;
                  });
                },
              ),
           SettingSwitch(
                title: "Dark Mode",
                icon: Icons.dark_mode,
                value: isDarkMode,
                onTap: (value) {
                  setState(() {
                    isDarkMode = value;
                  });
                },
              ),
          Column(
            children: List.generate(
              settings2.length,
               (index) => setting_tile(setting: settings2[index])
               ),
               ),    
          const SizedBox(height: 20),
           Text
           ("For more information..",
           style: TextStyle(
            fontSize: 15,
            color:Colors.grey.shade600)),
            const SizedBox(height: 7,),
           Column(
            children: List.generate(
              settings3.length,
               (index) => setting_tile(setting: settings3[index])
               ),
               ),
          const SizedBox(height: 20),
           Text
           ("Log Out",
           style: TextStyle(
            fontSize: 15,
            color:Colors.grey.shade600)),
            const SizedBox(height: 7,),
            if (FirebaseAuth.instance.currentUser != null)
            GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
                Get.offAll(() => const SignIn());
              },
              child: Row(children: [
              Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.only(bottom:10 ),
                decoration: BoxDecoration(
                  color: const Color(0xffF1F2F7),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.logout,color: Color.fromARGB(255, 47, 46, 46),),
                ),
                const SizedBox(width:10 ,),
                  const Text(
                  "Log Out",
                  style: TextStyle(
                  color: Color.fromARGB(255, 47, 46, 46),
                  fontSize:15,
                  fontWeight: FontWeight.bold
                ),),
                const Spacer(),
                Icon(
                  CupertinoIcons.chevron_forward,
                  color: Colors.grey.shade600),
              ],),
            ),
          
        
        
          ],
          
          ),
      ),



    ),);
  }




  }

