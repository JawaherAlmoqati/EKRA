part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}


final class GetFavouriteItems extends FavouriteEvent {
  const GetFavouriteItems();
}

final class AddToFavourite extends FavouriteEvent {
  final String itemId;
  const AddToFavourite(this.itemId);

  @override
  List<Object> get props => [itemId];
}

final class RemoveFromFavourite extends FavouriteEvent {
  final String itemId;
  const RemoveFromFavourite(this.itemId);

  @override
  List<Object> get props => [itemId];
}

final class CheckIfFavourite extends FavouriteEvent {
  final String itemId;
  const CheckIfFavourite(this.itemId);

  @override
  List<Object> get props => [itemId];
}