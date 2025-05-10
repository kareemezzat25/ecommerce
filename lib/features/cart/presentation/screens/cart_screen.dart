import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/cart/presentation/bloc/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/features/cart/presentation/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool _dialogIsOpen = false;

  void _showLoadingDialog() {
    _dialogIsOpen = true;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.transparent,
        title: Center(
          child: CircularProgressIndicator(color: ColorManager.primary),
        ),
      ),
    );
  }

  void _closeDialogIfOpen() {
    if (_dialogIsOpen && Navigator.canPop(context)) {
      Navigator.pop(context);
      _dialogIsOpen = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartBloc>()..add(GetCartProductsEvent()),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          if (state.getCartProductsRequestState == RequestState.loading) {
            _showLoadingDialog();
          } else if (state.getCartProductsRequestState ==
              RequestState.success) {
            _closeDialogIfOpen();
          } else if (state.getCartProductsRequestState == RequestState.error) {
            _closeDialogIfOpen();
            // show error dialog...
          }

          // Remove product logic
          if (state.removeProductCartRequestState == RequestState.loading) {
            _showLoadingDialog();
          } else if (state.removeProductCartRequestState ==
              RequestState.success) {
            _closeDialogIfOpen();
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Product Removed",
                      style: getBoldStyle(
                        color: ColorManager.primary,
                        fontSize: FontSize.s20,
                      ),
                    ),
                    content: Text(
                      "Item remove from Cart Successfully",
                      style: getMediumStyle(color: ColorManager.black),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorManager.primary,
                              padding: EdgeInsets.all(8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r))),
                          child: Text(
                            "Ok",
                            style: getBoldStyle(
                                color: ColorManager.white,
                                fontSize: AppSize.s20),
                          ))
                    ],
                  );
                });
          } else if (state.removeProductCartRequestState ==
              RequestState.error) {
            _closeDialogIfOpen();
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'Cart',
                style:
                    getMediumStyle(fontSize: 20, color: ColorManager.textColor),
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
                  icon: Badge(
                    label: Text(
                        "${state.getCartProductsResponseModel?.numOfCartItems ?? 0}"),
                    child: ImageIcon(
                      AssetImage(IconsAssets.icCart),
                      color: ColorManager.primary,
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p14),
              child: state.getCartProductsResponseModel?.numOfCartItems == 0
                  ? Center(
                      child: Text(
                        "Your cart is empty!",
                        style: getBoldStyle(
                            fontSize: FontSize.s24, color: Colors.black),
                      ),
                    )
                  : Column(
                      children: [
                        Expanded(
                          // the list of cart items ===============
                          child: ListView.separated(
                            itemBuilder: (context, index) => CartItemWidget(
                              imagePath: state
                                      .getCartProductsResponseModel
                                      ?.data
                                      .products[index]
                                      .product
                                      .imageCover ??
                                  "",
                              title: state.getCartProductsResponseModel?.data
                                      .products[index].product.title ??
                                  "",
                              price: (state.getCartProductsResponseModel?.data
                                          .products[index].price ??
                                      0)
                                  .toDouble(),
                              quantity: state.getCartProductsResponseModel?.data
                                      .products[index].count ??
                                  0,
                              onDeleteTap: () {
                                BlocProvider.of<CartBloc>(context).add(
                                    RemoveProductCartEvent(state
                                            .getCartProductsResponseModel
                                            ?.data
                                            .products[index]
                                            .product
                                            .id ??
                                        ""));
                              },
                              onDecrementTap: (value) {},
                              onIncrementTap: (value) {},
                              size: 40,
                              color: Colors.black,
                              colorName: 'Black',
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: AppSize.s12.h),
                            itemCount: state.getCartProductsResponseModel
                                    ?.numOfCartItems ??
                                0,
                          ),
                        ),
                        // the total price and checkout button========
                        TotalPriceAndCheckoutBotton(
                          totalPrice: (state.getCartProductsResponseModel?.data
                                      .totalCartPrice ??
                                  0)
                              .toDouble(),
                          checkoutButtonOnTap: () {},
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
            ),
          );
        },
      ),
    );
  }
}
