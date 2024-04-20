import 'package:bloc/bloc.dart';
import 'package:ekra/features/shop/favourite/repo/favourite_service.dart';
import 'package:ekra/features/shop/models/product_model.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';
part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  List<ProductModel> favouriteProducts = [];
  List<String> favouriteItems = [];
  FavouriteBloc() : super(FavouriteInitial()) {
    FavoritesService service = FavoritesService();
    on<AddToFavourite>((event, emit) async {
      emit(AddToFavouriteInProgress());
      try {
        await service.addToFavorites(event.itemId);
        favouriteItems.add(event.itemId);
        emit(const AddToFavouriteSuccess());
      } catch (e) {
        emit(AddToFavouriteFailed(e.toString()));
      }
    });
    on<RemoveFromFavourite>((event, emit) async {
      emit(RemoveFromFavouriteInProgress());
      try {
        await service.removeFromFavorites(event.itemId);
        favouriteItems.remove(event.itemId);
        favouriteProducts.removeWhere((element) => element.id == event.itemId);
        emit(const RemoveFromFavouriteSuccess());
      } catch (e) {
        emit(RemoveFromFavouriteFailed(e.toString()));
      }
    });
    on<GetFavouriteItems>((event, emit) async {
      emit(GetFavouriteItemsInProgress());
      try {
        favouriteItems = await service.getFavorites();
        favouriteProducts = await service.getFavoriteProducts(favouriteItems);
        emit(GetFavouriteItemsSuccess(favouriteProducts));
      } catch (e) {
        emit(GetFavouriteItemsFailed(e.toString()));
      }
    });
    on<CheckIfFavourite>((event, emit) async {
      emit(CheckIfFavouriteInProgress());
      try {
        favouriteItems.contains(event.itemId) ? emit(const CheckIfFavouriteSuccess(true)) : emit(const CheckIfFavouriteSuccess(false));
      } catch (e) {
        emit(CheckIfFavouriteFailed(e.toString()));
      }
    });
  }
}
