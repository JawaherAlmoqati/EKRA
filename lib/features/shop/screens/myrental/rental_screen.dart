import 'package:ekra/features/shop/bloc/product_bloc.dart';
import 'package:ekra/features/shop/screens/myrental/order_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class MyRentalSc extends StatefulWidget {
  const MyRentalSc({super.key});

  @override
  State<MyRentalSc> createState() => _HomePageState();
}

class _HomePageState extends State<MyRentalSc> {
  late final ProductBloc _productBloc;

  @override
  void initState() {
    _productBloc = context.read<ProductBloc>();
    if (FirebaseAuth.instance.currentUser != null) {
      _productBloc.add(const GetRentedProductOrders());
      _productBloc.add(const GetOwnedProductOrders());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ProductBloc productBloc = context.watch<ProductBloc>();
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFE7E6E1), Color(0xFFFAFAFA)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: FirebaseAuth.instance.currentUser == null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Please login to view your rental items',
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        child: const Text('Login'),
                      )
                    ],
                  ),
                )
              : DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey[300],
                        ),
                        child: TabBar(
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(13),
                          ),
                          labelPadding: EdgeInsets.zero,
                          padding: EdgeInsets.zero,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black.withOpacity(0.5),
                          dividerColor: Colors.transparent,
                          tabs: const [
                            Center(
                              child: Tab(
                                text: 'Own',
                              ),
                            ),
                            Center(
                              child: Tab(
                                text: 'Rent',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            BlocConsumer<ProductBloc, ProductState>(
                              listener: (context, state) {
                                if (state is GetOwnedProductOrdersFailure) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(state.errorMessage),
                                  ));
                                }
                              },
                              builder: (context, state) {
                                if (state is GetOwnedProductOrdersInProgress) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return DefaultTabController(
                                  length: 2,
                                  child: Column(
                                    children: [
                                      const TabBar(
                                        tabs: [
                                          Tab(text: 'On Rent'),
                                          Tab(text: 'Requests'),
                                        ],
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          children: [
                                            if (productBloc
                                                .ownRentedOrders.isNotEmpty)
                                              ListView.builder(
                                                itemCount: productBloc
                                                    .ownRentedOrders.length,
                                                itemBuilder: (context, index) {
                                                  final order = productBloc
                                                      .ownRentedOrders[index];
                                                  return OrderTile(
                                                      order: order);
                                                },
                                              )
                                            else
                                              const Center(
                                                child: Text('No orders'),
                                              ),
                                            if (productBloc
                                                .ownRequests.isNotEmpty)
                                              ListView.builder(
                                                itemCount: productBloc
                                                    .ownRequests.length,
                                                itemBuilder: (context, index) {
                                                  final order = productBloc
                                                      .ownRequests[index];
                                                  return OrderTile(
                                                      order: order);
                                                },
                                              )
                                            else
                                              const Center(
                                                child: Text('No requests'),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            BlocConsumer<ProductBloc, ProductState>(
                              listener: (context, state) {
                                if (state is GetRentedProductOrdersFailure) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text(state.errorMessage),
                                  ));
                                }
                              },
                              builder: (context, state) {
                                if (state is GetRentedProductOrdersInProgress) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return DefaultTabController(
                                  length: 2,
                                  child: Column(
                                    children: [
                                      const TabBar(
                                        tabs: [
                                          Tab(text: 'On Rent'),
                                          Tab(text: 'Requests'),
                                        ],
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          children: [
                                            if (productBloc
                                                .rentedOrders.isNotEmpty)
                                              ListView.builder(
                                                itemCount: productBloc
                                                    .rentedOrders.length,
                                                itemBuilder: (context, index) {
                                                  final order = productBloc
                                                      .rentedOrders[index];
                                                  return OrderTile(
                                                      order: order);
                                                },
                                              )
                                            else
                                              const Center(
                                                child: Text('No orders'),
                                              ),
                                            if (productBloc
                                                .rentedRequests.isNotEmpty)
                                              ListView.builder(
                                                itemCount: productBloc
                                                    .rentedRequests.length,
                                                itemBuilder: (context, index) {
                                                  final order = productBloc
                                                      .rentedRequests[index];
                                                  return OrderTile(
                                                      order: order);
                                                },
                                              )
                                            else
                                              const Center(
                                                child: Text('No requests'),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
