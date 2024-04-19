import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekra/features/shop/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
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
  }
}
