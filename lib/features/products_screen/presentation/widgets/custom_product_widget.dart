import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:ecommerce_app/features/cart/presentation/bloc/bloc/cart_bloc.dart';
import 'package:ecommerce_app/features/product_details/presentation/screen/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomProductWidget extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final String title;
  final String description;
  final double price;
  final double priceAfterDiscount;
  final double rating;
  final String productId;

  const CustomProductWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.priceAfterDiscount,
      required this.rating,
      required this.productId});

  String truncateTitle(String title) {
    List<String> words = title.split(' ');
    if (words.length <= 2) {
      return title;
    } else {
      return "${words.sublist(0, 2).join(' ')}..";
    }
  }

  String truncateDescription(String description) {
    List<String> words = description.split(RegExp(r'[\s-]+'));
    if (words.length <= 4) {
      return description;
    } else {
      return "${words.sublist(0, 4).join(' ')}..";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ProductDetails(
          productId: productId,
        );
      })),
      child: Container(
        width: width * 0.4,
        height: height * 0.4,
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.primary.withOpacity(0.3),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  // Not working with the lastest flutter version

                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(14.r)),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      height: height * 0.2,
                      width: double.infinity,
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),

                  /*ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(14.r)),
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                      width: width,
                    ),
                  ),*/
                  Positioned(
                      top: height * 0.01,
                      right: width * 0.02,
                      child: HeartButton(onTap: () {})),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      truncateTitle(title),
                      maxLines: 1,
                      style: getMediumStyle(
                        color: ColorManager.textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: height * 0.002),
                    Text(
                      truncateDescription(description),
                      maxLines: 1,
                      style: getRegularStyle(
                        color: ColorManager.textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    SizedBox(
                      width: width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "EGP ${price == 0 ? priceAfterDiscount : price}",
                            style: getRegularStyle(
                              color: ColorManager.textColor,
                              fontSize: 14.sp,
                            ),
                          ),
                          price == 0
                              ? const SizedBox()
                              : Text(
                                  "$priceAfterDiscount",
                                  style: getTextWithLine(),
                                ),
                        ],
                      ),
                    ),
                    // SizedBox(height: height * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          // width: width * 0.22,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Review ($rating)",
                                style: getRegularStyle(
                                  color: ColorManager.textColor,
                                  fontSize: 12.sp,
                                ),
                              ),
                              const Icon(
                                Icons.star_rate_rounded,
                                color: ColorManager.starRateColor,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: InkWell(
                            onTap: () {
                              BlocProvider.of<CartBloc>(context)
                                  .add(AddToCartEvent(productId));
                            },
                            child: Container(
                              height: height * 0.036,
                              width: width * 0.08,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorManager.primary,
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
