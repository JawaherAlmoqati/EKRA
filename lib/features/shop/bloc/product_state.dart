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