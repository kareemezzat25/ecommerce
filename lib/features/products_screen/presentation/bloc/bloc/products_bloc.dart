import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/failures/failures.dart';
import 'package:ecommerce_app/features/auth/presentation/bloc/bloc/auth_bloc_bloc.dart';
import 'package:ecommerce_app/features/products_screen/data/models/productmodel.dart';
import 'package:ecommerce_app/features/products_screen/domain/usecases/getproducts_usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'products_event.dart';
part 'products_state.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  GetProductsUseCase getProductsUseCase;
  ProductsBloc(this.getProductsUseCase) : super(ProductsInitial()) {
    on<ProductsEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetProductsEvent>((event, emit) async {
      emit(state.copywith(getProductRequestState: RequestState.loading));
      log("hhhhhhh:${event.categoryId}");
      var result = await getProductsUseCase.call(id: event.categoryId);

      result.fold((model) {
        emit(state.copywith(
            getProductRequestState: RequestState.success, productModel: model));
      }, (error) {
        emit(state.copywith(
            getProductRequestState: RequestState.error,
            productsFailures: error));
      });
    });
  }
}
