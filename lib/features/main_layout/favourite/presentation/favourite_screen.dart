import 'package:ecommerce_app/core/resources/color_manager.dart';
import 'package:ecommerce_app/core/resources/constants_manager.dart';
import 'package:ecommerce_app/core/resources/font_manager.dart';
import 'package:ecommerce_app/core/resources/styles_manager.dart';
import 'package:ecommerce_app/core/resources/values_manager.dart';
import 'package:ecommerce_app/di.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/main_layout/favourite/data/models/favourite_model.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/bloc/bloc/favourites_bloc.dart';
import 'package:ecommerce_app/features/main_layout/favourite/presentation/widgets/favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<FavouritesBloc>()..add(GetUserFavouritesEvent()),
      child: BlocConsumer<FavouritesBloc, FavouritesState>(
        listener: (context, state) {
          if (state.getUserFavouritesRequestState == RequestState.loading) {
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
          } else if (state.getUserFavouritesRequestState ==
              RequestState.success) {
            Navigator.pop(context);
          } else if (state.getUserFavouritesRequestState ==
              RequestState.error) {
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
                      state.getUserFavouriteFailures?.message ??
                          "SomeThing Went Wrong",
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
          return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.s14.w, vertical: AppSize.s10.h),
              child: ListView.builder(
                itemCount: state.getUserFavouriteModel?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSize.s12.h),
                    child: FavoriteItem(
                        product: state.getUserFavouriteModel?.data?[index] ??
                            Data()),
                  );
                },
              ));
        },
      ),
    );
  }
}
