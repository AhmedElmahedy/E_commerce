import 'package:e_commerc/core/core/resources/color_manager.dart';
import 'package:e_commerc/features/product_details/presentation/screen/product_details.dart';
import 'package:e_commerc/features/products_screen/presentation/cubit/products_states.dart';
import 'package:e_commerc/features/products_screen/presentation/cubit/products_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core/resources/values_manager.dart';
import '../../../../core/core/widget/home_screen_app_bar.dart';
import '../widgets/custom_product_widget.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = ProductsViewModel.get(context);

    return BlocBuilder<ProductsViewModel, ProductsStates>(
      bloc: bloc..getAllProducts(),
      builder: (context, state) {
        return Scaffold(
          appBar: const HomeScreenAppBar(
            automaticallyImplyLeading: true,
          ),
          body: bloc.productsList.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    children: [
                      Expanded(
                        child: GridView.builder(
                          itemCount: bloc.productsList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 7 / 9,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                  ProductDetails(product: bloc.productsList[index])));
                                },
                                child: CustomProductWidget(
                                    product: bloc.productsList[index]));
                          },
                          scrollDirection: Axis.vertical,
                        ),
                      )
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                ),
        );
      },
    );
  }
}
