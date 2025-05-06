import 'package:ecommerce_app/core/resources/assets_manager.dart';
import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/bloc/bloc/categories_bloc_bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBlocBloc, CategoriesBlocState>(
      listener: (context, state) {
        if (state.subCategoriesOnCategoryRequestState == RequestState.loading) {
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
        } else if (state.subCategoriesOnCategoryRequestState ==
            RequestState.success) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context); // <-- this actually closes the dialog
          }
        } else if (state.subCategoriesOnCategoryRequestState ==
            RequestState.error) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    "Error",
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: FontSize.s20),
                  ),
                  content: Text(
                      state.subCategoriesOnCategoryFailures?.message ?? ""),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorManager.primary,
                            padding: const EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r))),
                        child: Text(
                          "Ok",
                          style: getBoldStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s20),
                        ))
                  ],
                );
              });
        }
      },
      builder: (context, state) {
        return Expanded(
          flex: 2,
          child: CustomScrollView(
            slivers: <Widget>[
              // category title
              SliverToBoxAdapter(
                child: Text(
                  'Laptops & Electronics',
                  style: getBoldStyle(
                      color: ColorManager.primary, fontSize: FontSize.s14),
                ),
              ),
              // the category card
              SliverToBoxAdapter(
                child: CategoryCardItem(
                    "Laptops & Electronics",
                    ImageAssets.categoryCardImage,
                    goToCategoryProductsListScreen),
              ),
              // the grid view of the subcategories

              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount:
                      (state.subCategoriesOnCategoryModel?.data?.isEmpty ??
                              true)
                          ? 1
                          : state.subCategoriesOnCategoryModel?.data?.length,
                  (context, index) {
                    if (state.subCategoriesOnCategoryModel?.data?.isEmpty ??
                        true) {
                      // Show a placeholder when no subcategories are found
                      return Center(
                        child: Text(
                          "No subcategories found",
                          style: getRegularStyle(color: ColorManager.primary),
                          textAlign: TextAlign.center,
                        ),
                      );
                    } else {
                      // Show actual subcategory item
                      final subCategory =
                          state.subCategoriesOnCategoryModel!.data![index];
                      return SubCategoryItem(
                        subCategory.name ?? "",
                        ImageAssets.categoryCardImage,
                        goToCategoryProductsListScreen,
                      );
                    }
                  },
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: AppSize.s8,
                  crossAxisSpacing: AppSize.s8,
                ),
              )
            ],
          ),
        );
      },
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
