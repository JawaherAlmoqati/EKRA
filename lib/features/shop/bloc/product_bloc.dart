import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekra/features/shop/models/order_model.dart';
import 'package:ekra/features/shop/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<OrderModel> orders = [];
  List<OrderModel> rentOrders = [];

  List<OrderModel> ownRentedOrders = [];
  List<OrderModel> ownRequests = [];

  List<OrderModel> rentedOrders = [];
  List<OrderModel> rentedRequests = [];

  ProductBloc() : super(ProductInitial()) {
    on<AddProductEvent>((event, emit) async {
      emit(AddProductInProgress());
      try {
        if (event.images != null) {
          event.product.images ??= [];
          for (var image in event.images!) {
            final result = await FirebaseStorage.instance.ref('products/${event.product.id}/${image.path.split('/').last}').putFile(image);
            final url = await result.ref.getDownloadURL();
            event.product.images?.add(url);
          }
        }
        await FirebaseFirestore.instance.collection('products').add(
              event.product.toJson(),
            );
        emit(const AddProductSuccess());
      } catch (e) {
        emit(AddProductFailure(errorMessage: e.toString()));
      }
    });
    on<GetProductOfSpecificUser>((event, emit) async {
      emit(GetProductOfSpecificUserInProgress());
      try {
        final snapshot = await FirebaseFirestore.instance.collection('products').where('userId', isEqualTo: event.userId).get();
        final products = snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
        emit(GetProductOfSpecificUserSuccess(products: products));
      } catch (e) {
        emit(GetProductOfSpecificUserFailure(errorMessage: e.toString()));
      }
    });
    on<BookProduct>((event, emit) async {
      emit(BookProductInProgress());
      try {
        final result = await FirebaseFirestore.instance.collection('orders').add(event.order.toJson());
        event.order.orderId = result.id;
        emit(BookProductSuccess(order: event.order));
      } catch (e) {
        emit(BookProductFailure(errorMessage: e.toString()));
      }
    });
    on<GetOwnedProductOrders>((event, emit) async {
      emit(GetOwnedProductOrdersInProgress());
      try {
        final snapshot = await FirebaseFirestore.instance.collection('orders').where('item.userId', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();
        orders = snapshot.docs.map((e) {
          OrderModel order = OrderModel.fromJson(e.data());
          order.orderId = e.id;
          return order;
        }).toList();
        ownRentedOrders = orders.where((element) => element.status == OrderStatus.onRent).toList();
        ownRequests = orders.where((element) => element.status == OrderStatus.pending).toList();
        emit(GetOwnedProductOrdersSuccess(orders: orders));
      } catch (e) {
        emit(GetOwnedProductOrdersFailure(errorMessage: e.toString()));
      }
    });
    on<UpdateOrderStatus>((event, emit) async {
      emit(UpdateOrderStatusInProgress());
      try {
        await FirebaseFirestore.instance.collection('orders').doc(event.orderId).update({'status': event.status.index});
        if (orders.isNotEmpty) {
          orders.where((element) => element.orderId == event.orderId).first.status = event.status;
          ownRentedOrders = orders.where((element) => element.status == OrderStatus.onRent).toList();
          ownRequests = orders.where((element) => element.status == OrderStatus.pending).toList();
        }

        if (rentOrders.isNotEmpty) {
          rentOrders.where((element) => element.orderId == event.orderId).first.status = event.status;
          rentedOrders = rentOrders.where((element) => element.status == OrderStatus.onRent).toList();
          rentedRequests = rentOrders.where((element) => element.status == OrderStatus.pending).toList();
        }
        emit(const UpdateOrderStatusSuccess());
      } catch (e) {
        emit(UpdateOrderStatusFailure(errorMessage: e.toString()));
      }
    });
    on<GetRentedProductOrders>((event, emit) async {
      emit(GetRentedProductOrdersInProgress());
      try {
        final snapshot = await FirebaseFirestore.instance.collection('orders').where('customerId', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get();
        rentOrders = snapshot.docs.map((e) {
          OrderModel order = OrderModel.fromJson(e.data());
          order.orderId = e.id;
          return order;
        }).toList();
        rentedOrders = rentOrders.where((element) => element.status == OrderStatus.onRent).toList();
        rentedRequests = rentOrders.where((element) => element.status == OrderStatus.pending).toList();
        emit(GetRentedProductOrdersSuccess(orders: orders));
      } catch (e) {
        emit(GetRentedProductOrdersFailure(errorMessage: e.toString()));
      }
    });
  }
}
