import 'package:ekra/features/shop/favourite/bloc/favourite_bloc.dart';
import 'package:ekra/features/shop/favourite/views/product_card_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late final FavouriteBloc _favouriteBloc;

  @override
  void initState() {
    _favouriteBloc = context.read<FavouriteBloc>();
    _favouriteBloc.add(const GetFavouriteItems());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final FavouriteBloc favouriteBloc = context.watch<FavouriteBloc>();
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFE7E6E1), Color(0xFFFAFAFA)],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Favourite',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF3A3A3A),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Expanded(
                  child: BlocBuilder<FavouriteBloc, FavouriteState>(
                    builder: (context, state) {
                      if (state is GetFavouriteItemsInProgress) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is GetFavouriteItemsFailed) {
                        return Center(
                          child: Text(state.error),
                        );
                      }
                      if (_favouriteBloc.favouriteProducts.isEmpty) {
                        return const Center(child: Text('No Favourite Items'));
                      }
                      return RefreshIndicator.adaptive(
                        onRefresh: () async {
                          _favouriteBloc.add(const GetFavouriteItems());
                        },
                        child: ListView.separated(
                          itemCount: favouriteBloc.favouriteProducts.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 16),
                          itemBuilder: (_, index) => ProductCardHorizontal(
                            product: _favouriteBloc.favouriteProducts[index],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
