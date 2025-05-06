import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/main_layout/home/data/models/categories_model.dart';
import 'package:ecommerce_app/features/main_layout/home/domain/usecases/categories_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'categories_bloc_event.dart';
part 'categories_bloc_state.dart';

@injectable
class CategoriesBlocBloc
    extends Bloc<CategoriesBlocEvent, CategoriesBlocState> {
  CategoriesUsecase categoriesUsecase;
  CategoriesBlocBloc(this.categoriesUsecase) : super(CategoriesBlocInitial()) {
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
      }, (error) {
        emit(state.copyWith(
            categoriesRequestState: RequestState.error,
            categoriesFailures: error));
      });
    });
  }
}
