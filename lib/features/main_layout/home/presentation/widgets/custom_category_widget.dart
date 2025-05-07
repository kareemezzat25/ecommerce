import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/routes_manager/routes.dart';
import 'package:ecommerce_app/features/products_screen/presentation/screens/products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryWidget extends StatelessWidget {
  String categoryImage;
  String categoryName;
  String? categoryId;
  CustomCategoryWidget(
      {required this.categoryImage,
      required this.categoryName,
      this.categoryId,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log("CategoryId :$categoryId");
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ProductsScreen(
            id: categoryId,
          );
        }));
      },
      child: Column(
        children: [
          CachedNetworkImage(
            height: 100.h,
            width: 100.w,
            fit: BoxFit.fill,
            imageUrl: categoryImage,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                const Center(child: Icon(Icons.error)),
            imageBuilder: (context, imageProvider) {
              return Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          /*ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: Container(
              height: 100.h,
              width: 100.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                ImageAssets.categoryHomeImage,
                fit: BoxFit.cover,
              ),
            ),
          ),*/
          SizedBox(height: 8.h),
          Text(
            categoryName,
            style:
                getRegularStyle(color: ColorManager.darkBlue, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}
