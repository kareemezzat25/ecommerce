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
    bool isDialogVisible = false;

    return BlocConsumer<CategoriesBlocBloc, CategoriesBlocState>(
      listener: (context, state) {
        if (state.categoriesRequestState == RequestState.loading &&
            !isDialogVisible) {
          isDialogVisible = true;
          showDialog(
            context: context,
            barrierDismissible: false, // prevent auto dismiss
            builder: (context) {
              return AlertDialog(
                backgroundColor: Colors.transparent,
                title: Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.primary,
                  ),
                ),
              );
            },
          );
        } else if (state.categoriesRequestState == RequestState.success &&
            isDialogVisible) {
          Navigator.of(context, rootNavigator: true).pop(); // dismiss dialog
          isDialogVisible = false;
        } else if (state.categoriesRequestState == RequestState.error &&
            isDialogVisible) {
          Navigator.of(context, rootNavigator: true).pop(); // dismiss loading
          isDialogVisible = false;

          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Error",
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppSize.s20)),
                content: Text(state.categoriesFailures?.message ??
                    "Something went wrong"),
                actions: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r)),
                      backgroundColor: ColorManager.primary,
                    ),
                    child: Text("OK",
                        style: getMediumStyle(color: ColorManager.white)),
                  )
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        return Expanded(
          flex: 2,
          child: CustomScrollView(
            slivers: <Widget>[
              // category title
              // Title with BlocConsumer
              SliverToBoxAdapter(
                child: BlocConsumer<CategoriesBlocBloc, CategoriesBlocState>(
                  listener: (context, state) {
                    // handle listener if needed (optional for title)
                  },
                  builder: (context, state) {
                    return Text(
                      state.specificCategoryModel?.data?.name ?? "",
                      style: getBoldStyle(
                        color: ColorManager.primary,
                        fontSize: FontSize.s14,
                      ),
                    );
                  },
                ),
              ),

              SliverToBoxAdapter(
                child: BlocConsumer<CategoriesBlocBloc, CategoriesBlocState>(
                  listener: (context, state) {
                    // handle listener if needed (optional)
                  },
                  builder: (context, state) {
                    return CategoryCardItem(
                      state.specificCategoryModel?.data?.name ?? "",
                      state.specificCategoryModel?.data?.image ?? "",
                      goToCategoryProductsListScreen,
                    );
                  },
                ),
              ),

              // the grid view of the subcategories

              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.subCategoriesOnCategoryModel?.data?.length,
                  (context, index) {
                    // Show actual subcategory item
                    return SubCategoryItem(
                      state.subCategoriesOnCategoryModel?.data?[index].name ??
                          "",
                      ImageAssets.categoryCardImage,
                    );
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
