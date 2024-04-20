part of 'favourite_bloc.dart';

sealed class FavouriteState extends Equatable {
  const FavouriteState();
  
  @override
  List<Object> get props => [];
}

final class FavouriteInitial extends FavouriteState {}

final class GetFavouriteItemsInProgress extends FavouriteState {}

final class GetFavouriteItemsSuccess extends FavouriteState {
  final List<ProductModel> items;
  const GetFavouriteItemsSuccess(this.items);

  @override
  List<Object> get props => [items];
}

final class GetFavouriteItemsFailed extends FavouriteState {
  final String error;
  const GetFavouriteItemsFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class AddToFavouriteInProgress extends FavouriteState {}

final class AddToFavouriteSuccess extends FavouriteState {
  
  const AddToFavouriteSuccess();

  @override
  List<Object> get props => [];
}

final class AddToFavouriteFailed extends FavouriteState {
  final String error;
  const AddToFavouriteFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class RemoveFromFavouriteInProgress extends FavouriteState {}

final class RemoveFromFavouriteSuccess extends FavouriteState {
  
  const RemoveFromFavouriteSuccess();

  @override
  List<Object> get props => [];
}

final class RemoveFromFavouriteFailed extends FavouriteState {
  final String error;
  const RemoveFromFavouriteFailed(this.error);

  @override
  List<Object> get props => [error];
}

final class CheckIfFavouriteInProgress extends FavouriteState {}

final class CheckIfFavouriteSuccess extends FavouriteState {
  final bool isFavourite;
  const CheckIfFavouriteSuccess(this.isFavourite);

  @override
  List<Object> get props => [isFavourite];
}

final class CheckIfFavouriteFailed extends FavouriteState {
  final String error;
  const CheckIfFavouriteFailed(this.error);

  @override
  List<Object> get props => [error];
}

