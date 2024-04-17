part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class AddProductEvent extends ProductEvent {
  final ProductModel product;

  final List<File>? images ;

  const AddProductEvent({required this.product, this.images});

  @override
  List<Object> get props => [product];
}