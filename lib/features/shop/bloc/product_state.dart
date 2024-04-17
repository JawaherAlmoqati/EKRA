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