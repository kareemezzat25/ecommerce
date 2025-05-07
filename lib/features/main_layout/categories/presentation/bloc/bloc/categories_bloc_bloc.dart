import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/main_layout/categories/data/models/specificCategorymodel.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/usecases/specificcategory_usecase.dart';
import 'package:ecommerce_app/features/main_layout/categories/domain/usecases/subCategories_usecase.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/usecases/categories_usecase.dart';
import 'package:injectable/injectable.dart';

part 'categories_bloc_event.dart';
part 'categories_bloc_state.dart';

@injectable
class CategoriesBlocBloc
    extends Bloc<CategoriesBlocEvent, CategoriesBlocState> {
  CategoriesUsecase categoriesUsecase;
  SubCategoriesUseCase subCategoriesUseCase;
  SpecificCategoryUseCase specificCategoryUseCase;
  CategoriesBlocBloc(this.categoriesUsecase, this.subCategoriesUseCase,
      this.specificCategoryUseCase)
      : super(CategoriesBlocInitial()) {
    on<CategoriesBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetCategoriesEvent>((event, emit) async {
      emit(state.copyWith(categoriesRequestState: RequestState.loading));

      var result = await categoriesUsecase.call();
      result.fold((model) {
        emit(state.copyWith(
            categoriesRequestState: RequestState.success,
            categoriesModel: model));
        add(GetSpecificCategory(model.data?.first.sId ?? ""));
        add(GetSubCategoriesOnCategoryEvent(model.data?.first.sId ?? ""));
      }, (error) {
        emit(state.copyWith(
            categoriesRequestState: RequestState.error,
            categoriesFailures: error));
      });
    });
    on<GetSubCategoriesOnCategoryEvent>((event, emit) async {
      emit(state.copyWith(
          subCategoriesOnCategoryRequestState: RequestState.loading));

      var result = await subCategoriesUseCase.call(event.id);

      result.fold((model) {
        emit(state.copyWith(
            subCategoriesOnCategoryRequestState: RequestState.success,
            subCategoriesOnCategoryModel: model));
      }, (error) {
        emit(state.copyWith(
            subCategoriesOnCategoryRequestState: RequestState.error,
            subCategoriesOnCategoryFailures: error));
      });
    });
    on<GetSpecificCategory>((event, emit) async {
      emit(state.copyWith(specificCategoryRequestState: RequestState.loading));
      var result = await specificCategoryUseCase.call(event.id);
      result.fold((model) {
        emit(state.copyWith(
            specificCategoryRequestState: RequestState.success,
            specificCategoryModel: model));
      }, (error) {
        emit(state.copyWith(
            specificCategoryRequestState: RequestState.error,
            specificCategoryFailures: error));
      });
    });
    on<ChangeSelectedIndex>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
      add(GetSpecificCategory(
          state.categoriesModel?.data?[event.index].sId ?? ""));
      add(GetSubCategoriesOnCategoryEvent(
          state.categoriesModel?.data?[event.index].sId ?? ""));
    });
  }
}
