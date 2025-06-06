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
  bool _isDialogVisible = false;
  bool _snackbarShown = false;
  bool _dialogShown = false;

  void _showLoadingDialog() {
    _isDialogVisible = true;
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
    if (_isDialogVisible && Navigator.canPop(context)) {
      Navigator.pop(context);
      _isDialogVisible = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartBloc>()..add(GetCartProductsEvent()),
      child: BlocConsumer<CartBloc, CartState>(
        listener: (context, state) {
          final isLoading =
              state.getCartProductsRequestState == RequestState.loading ||
                  state.removeProductCartRequestState == RequestState.loading ||
                  state.removeCartRequestState == RequestState.loading;

          final isDone =
              state.getCartProductsRequestState != RequestState.loading &&
                  state.removeProductCartRequestState != RequestState.loading &&
                  state.removeCartRequestState != RequestState.loading;

          if (isLoading && !_isDialogVisible) {
            _showLoadingDialog();
          } else if (isDone && _isDialogVisible) {
            _closeDialogIfOpen();
          }

          // Handle successful product removal
          if (state.removeCartRequestState == RequestState.success &&
              !_snackbarShown) {
            _snackbarShown = true;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Product Removed from Cart!",
                    style: getMediumStyle(color: ColorManager.white)),
                backgroundColor: ColorManager.primary,
                duration: Duration(seconds: 2),
              ),
            );
          }

          // Show error dialog on failure (only once)
          if ((state.getCartProductsRequestState == RequestState.error ||
                  state.removeProductCartRequestState == RequestState.error ||
                  state.removeCartRequestState == RequestState.error) &&
              !_dialogShown) {
            _dialogShown = true; // Block further dialogs
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Error",
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: AppSize.s20)),
                  content: Text(
                      state.getCartProductsFailure?.message ??
                          state.removeProductCartFailures?.message ??
                          state.removeCartFailures?.message ??
                          "Something went wrong",
                      style: getMediumStyle(color: ColorManager.black)),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _dialogShown =
                            false; // Reset flag when dialog is dismissed
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r)),
                      ),
                      child: Text("OK",
                          style: getBoldStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s20)),
                    ),
                  ],
                );
              },
            );
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
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context).add(RemoveCartEvent());
                    },
                    icon: ImageIcon(
                      const AssetImage(IconsAssets.icDelete),
                      color: ColorManager.primary,
                    )),
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
              child:
                  (state.getCartProductsResponseModel?.numOfCartItems ?? 0) == 0
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
                                          ?.products?[index]
                                          .product
                                          ?.imageCover ??
                                      "",
                                  title: state
                                          .getCartProductsResponseModel
                                          ?.data
                                          ?.products?[index]
                                          .product
                                          ?.title ??
                                      "",
                                  price: (state.getCartProductsResponseModel
                                              ?.data?.products?[index].price ??
                                          0)
                                      .toDouble(),
                                  quantity: state.getCartProductsResponseModel
                                          ?.data?.products?[index].count ??
                                      0,
                                  onDeleteTap: () {
                                    BlocProvider.of<CartBloc>(context).add(
                                        RemoveProductCartEvent(state
                                                .getCartProductsResponseModel
                                                ?.data
                                                ?.products?[index]
                                                .product
                                                ?.id ??
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
                              totalPrice: (state.getCartProductsResponseModel
                                          ?.data?.totalCartPrice ??
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
