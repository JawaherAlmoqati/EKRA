import 'package:ekra/features/shop/models/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class setting_tile extends StatelessWidget {
  final Setting setting;
  const setting_tile({
    super.key,
    required this.setting
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(children: [
       Container(
         height: 50,
         width: 50,
         margin: const EdgeInsets.only(bottom:10 ),
         decoration: BoxDecoration(
           color: Color(0xffF1F2F7),
           borderRadius: BorderRadius.circular(15),
         ),
         child: Icon(setting.icon,color: Color.fromARGB(255, 47, 46, 46),),
         ),
         const SizedBox(width:10 ,),
          Text(
          setting.title,
          style: const TextStyle(
           color: Color.fromARGB(255, 47, 46, 46),
           fontSize:15,
           fontWeight: FontWeight.bold
         ),),
         const Spacer(),
         Text(setting.detail,
         style: TextStyle(fontSize: 15,
                color: Colors.grey.shade600,),),
         Icon(
           CupertinoIcons.chevron_forward,
           color: Colors.grey.shade600),
      ],),
    );
  }
}

