import 'package:ekra/features/personalization/models/user_model.dart';
import 'package:ekra/features/shop/bloc/product_bloc.dart';
import 'package:ekra/features/shop/screens/home/widgets/productcard.dart';
import 'package:ekra/widgets/user_products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({
    super.key,
    required this.user,
    required this.userId,
  });

  final UserModel user;
  final String userId;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  late final ProductBloc _productBloc;
  @override
  void initState() {
    _productBloc = context.read<ProductBloc>();
    _productBloc.add(GetProductOfSpecificUser(userId: widget.userId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Positioned(
                top: 14.h,
                left: 5.w,
                right: 5.w,
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60,
                      child: CircleAvatar(
                        backgroundColor: Colors.black54,
                        radius: 60,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Color(0xffCCCCCC),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.user.fullName ?? 'User Details',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Row(
              children: [
                Column(
                  children: [
                    Icon(
                      Icons.message,
                      color: Color(0xFF2C3B58),
                      size: 32,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "Message",
                      style: TextStyle(
                        color: Color(0xff5A5A5A),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 230,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Icon(
                          Icons.star,
                          color: Color(0xffFEBD59),
                          size: 32,
                        ),
                        Text(
                          "Review",
                          style: TextStyle(
                            color: Color(0xff5A5A5A),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(
                        color: Color(0xff5A5A5A),
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Color(0xffE5E5E5),
            ),
            const SizedBox(height: 10),
            const Text(
              'Products',
              style: TextStyle(
                color: Color(0xff3A3A3A),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            const Expanded(
              child: UserProductsList(),
            ),
          ],
        ),
      ),
    );
  }
}
