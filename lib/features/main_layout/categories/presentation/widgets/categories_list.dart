import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/bloc/bloc/categories_bloc_bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  // Index of the currently selected category
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBlocBloc, CategoriesBlocState>(
      listener: (context, state) {
        if (state.categoriesRequestState == RequestState.loading) {
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
        } else if (state.categoriesRequestState == RequestState.success) {
          Navigator.pop(context);
        } else if (state.categoriesRequestState == RequestState.error) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    "Error",
                    style: getBoldStyle(
                        color: ColorManager.primary, fontSize: AppSize.s20),
                  ),
                  content: Text(state.categoriesFailures?.message ??
                      "SomeThing Went Wrong"),
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
                          style: getMediumStyle(
                              color: ColorManager.white,
                              fontSize: FontSize.s18),
                        ))
                  ],
                );
              });
        }
      },
      builder: (context, state) {
        return Expanded(
            child: Container(
          decoration: BoxDecoration(
            color: ColorManager.containerGray,
            border: Border(
                // set the border for only 3 sides
                top: BorderSide(
                    width: AppSize.s2,
                    color: ColorManager.primary.withOpacity(0.3)),
                left: BorderSide(
                    width: AppSize.s2,
                    color: ColorManager.primary.withOpacity(0.3)),
                bottom: BorderSide(
                    width: AppSize.s2,
                    color: ColorManager.primary.withOpacity(0.3))),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSize.s12),
              bottomLeft: Radius.circular(AppSize.s12),
            ),
          ),

          // the categories items list
          child: ClipRRect(
            // clip the corners of the container that hold the list view
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(AppSize.s12),
              bottomLeft: Radius.circular(AppSize.s12),
            ),
            child: ListView.builder(
              itemCount: state.categoriesModel?.data?.length ?? 0,
              itemBuilder: (context, index) => CategoryItem(
                  index,
                  state.categoriesModel?.data?[index].name ?? "",
                  selectedIndex == index,
                  onItemClick),
            ),
          ),
        ));
      },
    );
  }

  // callback function to change the selected index
  onItemClick(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
