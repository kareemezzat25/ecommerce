import 'dart:async';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/bloc/bloc/home_bloc.dart';
import 'package:ecommerce_app/features/main_layout/home/presentation/widgets/custom_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../widgets/custom_ads_widget.dart';
import '../widgets/custom_section_bar.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int _currentIndex = 0;
  late Timer _timer;

  final List<String> adsImages = [
    ImageAssets.carouselSlider1,
    ImageAssets.carouselSlider2,
    ImageAssets.carouselSlider3,
  ];

  @override
  void initState() {
    super.initState();
    _startImageSwitching();
  }

  void _startImageSwitching() {
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % adsImages.length;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(HomeCategoriesEvent()),
      child: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state.homeCatgeoriesState == RequestState.loading) {
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
          } else if (state.homeCatgeoriesState == RequestState.success) {
            Navigator.pop(context);
          } else if (state.homeCatgeoriesState == RequestState.error) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Error",
                      style: getBoldStyle(
                        color: ColorManager.primary,
                        fontSize: FontSize.s20,
                      ),
                    ),
                    content: Text(
                      state.failures?.message ?? "SomeThing Went Wrong",
                      style: getMediumStyle(color: ColorManager.black),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
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
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                CustomAdsWidget(
                  adsImages: adsImages,
                  currentIndex: _currentIndex,
                  timer: _timer,
                ),
                Column(
                  children: [
                    CustomSectionBar(
                        sectionNname: 'Categories', function: () {}),
                    SizedBox(
                      height: 270.h,
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CustomCategoryWidget(
                            categoryImage:
                                state.categoriesModel?.data?[index].image ?? "",
                            categoryName:
                                state.categoriesModel?.data?[index].name ?? "",
                          );
                        },
                        itemCount: state.categoriesModel?.data?.length ?? 0,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                      ),
                    ),
                    // SizedBox(height: 12.h),
                    // CustomSectionBar(sectionNname: 'Brands', function: () {}),
                    // SizedBox(
                    //   height: 270.h,
                    //   child: GridView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemBuilder: (context, index) {
                    //       return const CustomBrandWidget();
                    //     },
                    //     itemCount: 20,
                    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //       crossAxisCount: 2,
                    //     ),
                    //   ),
                    // ),
                    // CustomSectionBar(
                    //   sectionNname: 'Most Selling Products',
                    //   function: () {},
                    // ),
                    // SizedBox(
                    //   child: SizedBox(
                    //     height: 360.h,
                    //     child: ListView.builder(
                    //       scrollDirection: Axis.horizontal,
                    //       itemBuilder: (context, index) {
                    //         return const ProductCard(
                    //           title: "Nike Air Jordon",
                    //           description:
                    //               "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories",
                    //           rating: 4.5,
                    //           price: 1100,
                    //           priceBeforeDiscound: 1500,
                    //           image: ImageAssets.categoryHomeImage,
                    //         );
                    //       },
                    //       itemCount: 20,
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 12.h),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
