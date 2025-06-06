import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/widget/heart_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.imageUrl, this.onTap});
  final String imageUrl;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      imageBuilder: (context, image) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        height: 300.h,
        decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(15.r),
        ),
        alignment: Alignment.topRight,
        child: HeartButton(
          onTap: onTap,
        ),
      ),
    );
  }
}
