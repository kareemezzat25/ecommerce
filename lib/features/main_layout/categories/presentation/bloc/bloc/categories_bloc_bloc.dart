import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
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
  CategoriesBlocBloc(this.categoriesUsecase, this.subCategoriesUseCase)
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
        print("Success");
        emit(state.copyWith(
            subCategoriesOnCategoryRequestState: RequestState.success,
            subCategoriesOnCategoryModel: model));
      }, (error) {
        emit(state.copyWith(
            subCategoriesOnCategoryRequestState: RequestState.error,
            subCategoriesOnCategoryFailures: error));
      });
    });
    on<ChangeSelectedIndex>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
      print("in c:${state.selectedIndex}");
      add(GetSubCategoriesOnCategoryEvent(
          state.categoriesModel?.data?[event.index].sId ?? ""));
    });
  }
}
