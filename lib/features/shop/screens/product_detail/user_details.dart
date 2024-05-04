import 'package:ekra/features/personalization/models/user_model.dart';
import 'package:ekra/features/shop/bloc/product_bloc.dart';
import 'package:ekra/features/shop/screens/home/widgets/productcard.dart';
import 'package:ekra/widgets/user_products_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        title: Text(widget.user.fullName ?? 'User Details'),
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
            Row(
              children: [
                const Text('Email'),
                const Spacer(),
                Text(widget.user.email ?? ''),
              ],
            ),
            if (widget.user.phoneNumber != null && widget.user.phoneNumber!.isNotEmpty) const SizedBox(height: 10),
            if (widget.user.phoneNumber != null && widget.user.phoneNumber!.isNotEmpty)
              Row(
                children: [
                  const Text('Phone'),
                  const Spacer(),
                  Text(widget.user.phoneNumber ?? ''),
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
            Expanded(
              child: UserProductsList(),
            ),
          ],
        ),
      ),
    );
  }
}
