import 'package:ekra/features/shop/bloc/product_bloc.dart';
import 'package:ekra/features/shop/screens/home/widgets/productcard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProductsList extends StatelessWidget {
  const UserProductsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is GetProductOfSpecificUserInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is GetProductOfSpecificUserSuccess) {
          if (state.products.isEmpty) {
            return const Center(
              child: Text('No products found'),
            );
          }

          return GridView.builder(
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: state.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              mainAxisExtent: 293,
            ),
            itemBuilder: (context, index) {
              final product = state.products[index];
              return ProductCard(
                item: product,
              );
            },
          );
        } else if (state is GetProductOfSpecificUserFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        }
        return const SizedBox();
      },
    );
  }
}
