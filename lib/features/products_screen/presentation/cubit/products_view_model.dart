import 'package:e_commerc/domain/entities/ProductResponseEntity.dart';
import 'package:e_commerc/domain/use_cases/get_all_products_use_case.dart';
import 'package:e_commerc/features/products_screen/presentation/cubit/products_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


@injectable
class ProductsViewModel extends Cubit<ProductsStates> {
  GetAllProductsUseCase getAllProductsUseCase;
  ProductsViewModel({required this.getAllProductsUseCase}) : super(ProductsInitialState());

  // todo : hold data - handle logic
  List<ProductDataEntity> productsList = [];

  static ProductsViewModel get(context) => BlocProvider.of(context);

  void getAllProducts()async{
    emit(ProductsLoadingState());
    var either = await getAllProductsUseCase.invoke();
    either.fold((error){
      emit(ProductsErrorState(failures: error));
    }
        , (response){
      productsList = response.data ?? [];
      emit(ProductsSuccessState(responseEntity: response));
        });

  }
}
