import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/use_cases/add_to_cart_use_case.dart';
import 'package:e_commerc/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerc/features/products_screen/presentation/cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsViewModel extends Cubit<ProductsStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  AddToCartUseCase addToCartUseCase;

  ProductsViewModel(
      {required this.getAllProductsUseCase, required this.addToCartUseCase})
      : super(ProductsInitialState());

  // todo : hold data - handle logic
  List<ProductDataEntity> productsList = [];
  int numOfCartItems = 0 ;

  static ProductsViewModel get(context) => BlocProvider.of(context);

  void getAllProducts() async {
    emit(ProductsLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold((error) {
      emit(ProductsErrorState(failures: error));
    }, (response) {
      productsList = response.data ?? [];
      emit(ProductsSuccessState(responseEntity: response));
    });
  }

  void addToCart(String productId) async {
    emit(AddToCartLoadingState());
    var either = await addToCartUseCase.invoke(productId);
    either.fold((error) {
      emit(AddToCartErrorState(failures: error));

    }, (response) {
      numOfCartItems = response.numOfCartItems!.toInt();
      print("numOFCartItems: $numOfCartItems");
      emit(AddToCartSuccessState(responseEntity: response));
    });
  }
}
