import 'package:e_commerc/features/cart/cubit/cart_states.dart';
import 'package:e_commerc/features/cart/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core/resources/assets_manager.dart';
import '../../../core/core/resources/color_manager.dart';
import '../../../core/core/resources/styles_manager.dart';
import '../../../core/core/resources/values_manager.dart';
import '../widgets/cart_item_widget.dart';
import '../widgets/total_price_and_checkout_botton.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var bloc = CartViewModel.get(context)..getCart();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(
                IconsAssets.icSearch,
              ),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(IconsAssets.icCart),
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: BlocBuilder<CartViewModel, CartStates>(
        bloc: bloc,
        builder: (context, state) {
          return state is GetCartSuccessState
              ? Padding(
                  padding: const EdgeInsets.all(AppPadding.p14),
                  child: Column(
                    children: [
                      Expanded(
                        // the list of cart items ===============
                        child: ListView.separated(
                          itemBuilder: (context, index) => CartItemWidget(
                              getProductsCartEntity:
                                  state.responseEntity.data!.products![index]),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: AppSize.s12.h),
                          itemCount: state.responseEntity.data!.products!.length,
                        ),
                      ),
                      // the total price and checkout button========
                      TotalPriceAndCheckoutBotton(
                        totalPrice:
                            state.responseEntity.data!.totalCartPrice!.toInt(),
                        checkoutButtonOnTap: () {},
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                );
        },
      ),
    );
  }
}
