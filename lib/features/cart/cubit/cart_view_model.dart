import 'package:dartz/dartz.dart';
import 'package:e_commerc/domain/entities/GetCartResponseEntity.dart';
import 'package:e_commerc/domain/use_cases/delete_item_in_cart_use_case.dart';
import 'package:e_commerc/domain/use_cases/get_cart_use_case.dart';
import 'package:e_commerc/domain/use_cases/update_count_in_cart_use_case.dart';
import 'package:e_commerc/features/cart/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartViewModel extends Cubit<CartStates> {
  GetCartUseCase getCartUseCase;
  DeleteItemInCartUseCase deleteItemInCartUseCase;
  UpdateCountItemInCartUseCase updateCount;


  CartViewModel(
      {required this.getCartUseCase, required this.deleteItemInCartUseCase,required this.updateCount})
      : super(CartInitialState());

  // todo : hold data - handle logic
  static CartViewModel get(context) => BlocProvider.of(context);

  List<GetProductsCartEntity> productsList = [];

  void getCart() async {
    emit(GetCartLoadingState());
    var either = await getCartUseCase.invoke();
    either.fold((error) {
      emit(GetCartErrorState(failures: error));
    }, (response) {
      productsList = response.data!.products!;
      emit(GetCartSuccessState(responseEntity: response));
    });
  }

  void deleteItemInCart(String productId) async{
    // emit(DeleteItemInCartLoadingState());
    var either =await deleteItemInCartUseCase.invoke(productId);
    either.fold((error){
      emit(DeleteItemInCartErrorState(failures: error));
    }, (response){
      emit(GetCartSuccessState(responseEntity: response));
    });
  }

  void updateCountInCart(String productId, int count)async{
    var either = await updateCount.invoke(productId, count);
    either.fold((error){
      emit(UpdateCountInCartErrorState(failures: error));
    }
        ,(response){
      emit(GetCartSuccessState(responseEntity: response));
        });
  }
}
