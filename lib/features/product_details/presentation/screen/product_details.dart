import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/custom_elevated_button.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/product_details/presentation/bloc/bloc/product_details_bloc.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_color.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_description.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_item.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_label.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_rating.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_size.dart';
import 'package:ecommerce_app/features/product_details/presentation/widgets/product_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetails extends StatelessWidget {
  String? productId;
  ProductDetails({this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProductDetailsBloc>()..add(GetProductDetailsEvent(productId!)),
      child: BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
        listener: (context, state) {
          if (state.productDetailsRequestState == RequestState.loading) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: ColorManager.transparent,
                    title: Center(
                      child: CircularProgressIndicator(
                        color: ColorManager.primary,
                      ),
                    ),
                  );
                });
          } else if (state.productDetailsRequestState == RequestState.success) {
            Navigator.pop(context);
          } else if (state.productDetailsRequestState == RequestState.error) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Error",
                      style: getBoldStyle(
                          color: ColorManager.primary, fontSize: FontSize.s20),
                    ),
                    content: Text(state.productFailures?.message ??
                        "SomeThing Went Wrong"),
                    actions: [
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(8),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.r))),
                          child: Text(
                            "Ok",
                            style: getRegularStyle(
                                color: Colors.white, fontSize: FontSize.s18),
                          ))
                    ],
                  );
                });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Product Details',
                style: getMediumStyle(color: ColorManager.appBarTitleColor)
                    .copyWith(fontSize: 20.sp),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(IconsAssets.icSearch),
                      color: ColorManager.primary,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: ColorManager.primary,
                    )),
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 50.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductSlider(
                          items: (state.productDetails?.data?.images ?? [])
                              .map(
                                  (imageUrl) => ProductItem(imageUrl: imageUrl))
                              .toList(),
                          initialIndex: 0),
                      SizedBox(
                        height: 24.h,
                      ),
                      ProductLabel(
                          productName: state.productDetails?.data?.title ?? "",
                          productPrice:
                              'EGP ${state.productDetails?.data?.priceAfterDiscount ?? state.productDetails?.data?.price ?? 0}'),
                      SizedBox(
                        height: 16.h,
                      ),
                      ProductRating(
                          productBuyers:
                              '${state.productDetails?.data?.sold ?? 0}',
                          productRating:
                              '${state.productDetails?.data?.ratingsAverage ?? 0} (${state.productDetails?.data?.ratingsQuantity ?? 0})'),
                      SizedBox(
                        height: 16.h,
                      ),
                      ProductDescription(
                          productDescription:
                              state.productDetails?.data?.description ?? ""),
                      ProductSize(
                        size: const [35, 38, 39, 40],
                        onSelected: () {},
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text('Color',
                          style: getMediumStyle(
                                  color: ColorManager.appBarTitleColor)
                              .copyWith(fontSize: 18.sp)),
                      ProductColor(color: const [
                        Colors.red,
                        Colors.blueAccent,
                        Colors.green,
                        Colors.yellow,
                      ], onSelected: () {}),
                      SizedBox(
                        height: 48.h,
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Total price',
                                style: getMediumStyle(
                                        color: ColorManager.primary
                                            .withOpacity(.6))
                                    .copyWith(fontSize: 18.sp),
                              ),
                              SizedBox(
                                height: 12.h,
                              ),
                              Text(
                                  'EGP ${state.productDetails?.data?.priceAfterDiscount ?? state.productDetails?.data?.price ?? 0}',
                                  style: getMediumStyle(
                                          color: ColorManager.appBarTitleColor)
                                      .copyWith(fontSize: 18.sp))
                            ],
                          ),
                          SizedBox(
                            width: 33.w,
                          ),
                          Expanded(
                            child: CustomElevatedButton(
                              label: 'Add to cart',
                              onTap: () {},
                              prefixIcon: Icon(
                                Icons.add_shopping_cart_outlined,
                                color: ColorManager.white,
                              ),
                            ),
                          )
                        ],
                      )
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
