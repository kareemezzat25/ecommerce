import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/bloc/bloc/categories_bloc_bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isDialogVisible = false;

    return BlocConsumer<CategoriesBlocBloc, CategoriesBlocState>(
      listener: (context, state) {
        if (state.categoriesRequestState == RequestState.loading &&
            !_isDialogVisible) {
          _isDialogVisible = true;
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
            _isDialogVisible) {
          Navigator.of(context, rootNavigator: true).pop(); // dismiss dialog
          _isDialogVisible = false;
        } else if (state.categoriesRequestState == RequestState.error &&
            _isDialogVisible) {
          Navigator.of(context, rootNavigator: true).pop(); // dismiss loading
          _isDialogVisible = false;

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
              )),

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
                  state.selectedIndex == index,
                  onItemClick),
            ),
          ),
        ));
      },
    );
  }

  // callback function to change the selected index
  onItemClick(int index, BuildContext context) {
    BlocProvider.of<CategoriesBlocBloc>(context)
        .add(ChangeSelectedIndex(index));
  }
}
