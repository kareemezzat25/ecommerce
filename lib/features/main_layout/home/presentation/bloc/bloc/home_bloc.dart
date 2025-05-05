import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/usecases/categories_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  CategoriesUsecase categoriesUsecase;
  HomeBloc(this.categoriesUsecase) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeCategoriesEvent>(
      (event, emit) async {
        emit(state.copyWith(homeCategoriesState: RequestState.loading));
        var result = await categoriesUsecase.call();
        result.fold((categories) {
          emit(state.copyWith(
              homeCategoriesState: RequestState.success,
              categoriesModel: categories));
        }, (error) {
          emit(state.copyWith(
              homeCategoriesState: RequestState.error, failures: error));
        });
      },
    );
  }
}
