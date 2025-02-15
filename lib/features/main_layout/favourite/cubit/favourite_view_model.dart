import 'package:e_commerc/domain/use_cases/get_products_wishlist_use_case.dart';
import 'package:e_commerc/features/main_layout/favourite/cubit/favourite_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class FavouriteViewModel extends Cubit<FavouriteStates> {
  GetProductsWishlistUseCase getProductsWishlistUseCase;

  FavouriteViewModel({required this.getProductsWishlistUseCase})
      : super(FavouriteInitialState());

  // todo: hold data - handel logic
  void getProductsWishlist() async {
    emit(FavouriteLoadingState());
    var either = await getProductsWishlistUseCase.invoke();
    either.fold((error) {
      emit(FavouriteErrorState(failures: error));
    }, (response) {
      emit(FavouriteSuccessState(productResponseEntity: response));
    });
  }
}
