part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class AddProductInProgress extends ProductState {}

final class AddProductSuccess extends ProductState {
  const AddProductSuccess();

  @override
  List<Object> get props => [];
}

final class AddProductFailure extends ProductState {
  final String errorMessage;

  const AddProductFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class GetProductOfSpecificUserInProgress extends ProductState {}

final class GetProductOfSpecificUserSuccess extends ProductState {
  final List<ProductModel> products;

  const GetProductOfSpecificUserSuccess({required this.products});

  @override
  List<Object> get props => [products];
}

final class GetProductOfSpecificUserFailure extends ProductState {
  final String errorMessage;

  const GetProductOfSpecificUserFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class BookProductInProgress extends ProductState {}

final class BookProductSuccess extends ProductState {
  final OrderModel order;

  const BookProductSuccess({required this.order});

  @override
  List<Object> get props => [order];
}

final class BookProductFailure extends ProductState {
  final String errorMessage;

  const BookProductFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class GetOwnedProductOrdersInProgress extends ProductState {}

final class GetOwnedProductOrdersSuccess extends ProductState {
  final List<OrderModel> orders;

  const GetOwnedProductOrdersSuccess({required this.orders});

  @override
  List<Object> get props => [orders];
}

final class GetOwnedProductOrdersFailure extends ProductState {
  final String errorMessage;

  const GetOwnedProductOrdersFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class UpdateOrderStatusInProgress extends ProductState {}

final class UpdateOrderStatusSuccess extends ProductState {
  const UpdateOrderStatusSuccess();

  @override
  List<Object> get props => [];
}

final class UpdateOrderStatusFailure extends ProductState {
  final String errorMessage;

  const UpdateOrderStatusFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

final class GetRentedProductOrdersInProgress extends ProductState {}

final class GetRentedProductOrdersSuccess extends ProductState {
  final List<OrderModel> orders;

  const GetRentedProductOrdersSuccess({required this.orders});

  @override
  List<Object> get props => [orders];
}

final class GetRentedProductOrdersFailure extends ProductState {
  final String errorMessage;

  const GetRentedProductOrdersFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
