part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class AddProductEvent extends ProductEvent {
  final ProductModel product;

  final List<File>? images;

  const AddProductEvent({required this.product, this.images});

  @override
  List<Object> get props => [product];
}

final class GetProductOfSpecificUser extends ProductEvent {
  final String userId;

  const GetProductOfSpecificUser({required this.userId});

  @override
  List<Object> get props => [userId];
}

final class BookProduct extends ProductEvent {
  final OrderModel order;

  const BookProduct({required this.order});

  @override
  List<Object> get props => [order];
}

final class GetOwnedProductOrders extends ProductEvent {
  const GetOwnedProductOrders();

  @override
  List<Object> get props => [];
}

final class UpdateOrderStatus extends ProductEvent {
  final String orderId;
  final OrderStatus status;

  const UpdateOrderStatus({
    required this.orderId,
    required this.status,
  });

  @override
  List<Object> get props => [orderId, status];
}

final class GetRentedProductOrders extends ProductEvent {
  const GetRentedProductOrders();

  @override
  List<Object> get props => [];
}
