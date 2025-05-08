import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/products_screen/presentation/bloc/bloc/products_bloc.dart';
import 'package:ecommerce_app/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  String? id;
  ProductsScreen({this.id, super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => getIt<ProductsBloc>()..add(GetProductsEvent(id)),
      child: BlocConsumer<ProductsBloc, ProductsState>(
        listener: (context, state) {
          if (state.getProductRequestState == RequestState.loading) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.transparent,
                    title: Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primary,
                      ),
                    ),
                  );
                });
          } else if (state.getProductRequestState == RequestState.success) {
            Navigator.pop(context);
          } else if (state.getProductRequestState == RequestState.error) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Error",
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: FontSize.s20),
                    ),
                    content: Text(state.productsFailures?.message ??
                        "SomeThing went Wrong"),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              backgroundColor: ColorManager.primary,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r))),
                          child: Text(
                            "Ok",
                            style: getRegularStyle(
                                color: ColorManager.primary,
                                fontSize: FontSize.s20),
                          ))
                    ],
                  );
                });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const HomeScreenAppBar(
              automaticallyImplyLeading: true,
            ),
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.productModel?.results ?? 0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        childAspectRatio: 7 / 9,
                      ),
                      itemBuilder: (context, index) {
                        return CustomProductWidget(
                          image:
                              state.productModel?.data?[index].imageCover ?? "",
                          title: state.productModel?.data?[index].title ?? "",
                          price: (state.productModel?.data?[index]
                                      .priceAfterDiscount ??
                                  0)
                              .toDouble(),
                          rating:
                              state.productModel?.data?[index].ratingsAverage ??
                                  0,
                          priceAfterDiscount: double.parse(
                              (state.productModel?.data?[index].price)
                                      .toString() ??
                                  "0.0"),
                          height: height,
                          width: width,
                          description:
                              state.productModel?.data?[index].description ??
                                  "",
                          productId: state.productModel?.data?[index].id ?? "",
                        );
                      },
                      scrollDirection: Axis.vertical,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
