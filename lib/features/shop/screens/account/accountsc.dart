import 'package:ekra/features/shop/controllers/product_controller.dart';
import 'package:ekra/features/shop/models/product_model.dart';
import 'package:ekra/features/shop/screens/account/settings.dart';
import 'package:ekra/features/shop/screens/home/notifications.dart';
import 'package:ekra/features/shop/screens/home/widgets/productcard.dart';
import 'package:ekra/features/shop/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
  final controller = Get.find<ProductController>();
  final ProductModel item;


    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 20.w,
            child: Image.asset(
              "assets/images/blue.png",
              fit: BoxFit.cover,
              height: 40.h,
              // width: 100.w,
            ),
          ),
          Positioned(
            top: -22.w,
            left: -10.w,
            // width: 40.w,
            height: 80.h,
            child: Image.asset(
              "assets/images/yellow.png",
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: 5.w,
            top: 9.h,
            child: GestureDetector(
                  onTap: () {
                    Get.to(() => const NotificationPage());
                  },
                child: const Icon(
                  Icons.notifications,
                  size: 32,
                  color: Colors.black54,
                ),
              ),),
            Positioned(
            right: 5.w,
            top: 9.h,
            child: GestureDetector(
                  onTap: () {
                    Get.to(() => const settingsscreen());
                  },
                child: const Icon(
                  Icons.settings,
                  size: 32,
                  color: Colors.black54,
                ),
              ),),
            Positioned(
            top: 14.h,
            left: 5.w,
            right:5.w,
            child:Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                   radius: 60,
                  child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    radius: 60,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Color(0xffCCCCCC),
                    ),),
                ),
                SizedBox(height: 10,),
                Text(
                  "account name",
                  style:TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  )
                )
                
                ]
                ,) ),
            Positioned(
            right: 12.w,
            top: 33.h,
                child: const Row(
                  children: [
                      Icon(
                          Icons.star,
                          color: Colors.black54,
                          size: 32,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "0.0",
                          style: TextStyle(
                            color: Color(0xff5A5A5A),
                            fontSize: 14,
                          ),
                        ),
                ]
                 

                  ,),),
            Positioned(
            right: 11.w,
            top: 36.5.h, 
            child: Text(
                          "Review",
                          style: TextStyle(
                            color: Color(0xff5A5A5A),
                            fontSize: 14,
                          ),
                        ),),
            Positioned(
            left: 12.w,
            top: 33.h,
                child: const Column(
                  children: [
                      Icon(
                          Icons.message,
                          color: Colors.black54,
                          size: 32,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "Message",
                          style: TextStyle(
                            color: Color(0xff5A5A5A),
                            fontSize: 14,
                          ),
                        ),
                ]
                  ,)),
            Positioned(
            top: 40.h,
            left: 5.w,
            right:5.w,
                child: const Column(
                  children: [
                      Center(
                        child: Text(
                          "Experienced construction equipment rental specialist",
                          style: TextStyle(
                            color: Color(0xff5A5A5A),
                            fontSize: 14,
                          ),
                        ),),
                        const SizedBox(width: 4),
                        const Text(
                          "Saudi Arabia, Qassim , Buraydah",
                          style: TextStyle(
                            color: Color(0xff5A5A5A),
                            fontSize: 14,
                          ),
                        ),
                ]
                  ,)
            ),
                  
          Positioned(
            top: 45.h,
            left: 5.w,
            right:5.w,
          child:SingleChildScrollView(
            child:
            ListView.builder(
            itemCount: controller.featuredProducts.length,
            shrinkWrap:true ,
            itemBuilder: (BuildContext context, int index ){
            return Padding(padding: EdgeInsets.all(15),
            child:InkWell(
            onTap: () {},
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            ) ,);
          
        })
          
          ),),   
        ],
      ),
    );
  }
}
